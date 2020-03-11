### Objectives

The objectives of this document are to provide an overarching design for each region as well as the implementation in more detail. With this design, we can spin up our stack in the new region easily with few changes such as region name, CIDR, number of nodes for each service. DNS for the proxy which will be the only entry point of our system.

This document has 3 main sections:

1. Overview - which will provide high level design including different components such as builders, databases, services (metasearch, places, hotels, flights, autocomplete, handoff services, kong, konga) and how they are related to each others.
2. Design principles and basic concepts - will explain the key principle that we will follow and making any design decision in term of security, simplicity, modularity, scalability and performance followed with some basic concepts that we are using in this document such NAT, IGW, VPC and more.
3. Design in detail and implementation - will explain in detail for each component and that will be the input when writing terraform script.

### Overview

![ img ](https://lh3.googleusercontent.com/f3x97Iy3FJBi_prnUnFWOGkC3GDsUQ_GAOUKgqKnEu8HxQTuwDeVftRf3AwF57_WwUA_vegbSiaBpkTWriwDQv2NTdSiLP915M6NMc8jcxWHX4pbjL9DWGdPxmXUBQGS4LIBVhHX=w624-h493-no)

For each region, we will have 4 VPCs.

Services VPC will be the public-facing entry point for Wego users. It will have an ELB in the public subnet to forward requests to internal-facing services in private subnet (metasearch flights and hotels, various microservices etc.). Those services will then process the requests and return the response.

Blackhole VPC provides another public-facing entry point. Its main purpose is to provide SSH access via bastion hosts to the private network for administrative purposes. This will be used by Wego engineers.

Builders VPC is used to automate the build and release process. Jenkins instances in builders VPC will build application artifacts. Deployer (Spinnaker) instances will bake AMIs and deploy them.

Databases VPC will contain data stores such as RDS (relational DB), ElastiCache (Redis) and Elasticsearch instances. It peers with services VPC to allow access to the data layer.

### Basic Concepts

As noted in the AWS docs, there are [various types](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenarios.html) of VPCs we can implement. For our case, we will be implementing [VPCs with Public and Private Subnets (NAT)](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html).

Before we delve deeper into the VPC blueprint, we need to get acquainted with some networking terminology:

An **Internet Gateway** (IGW) allows resources within your VPC to access the Internet, and vice versa. In order for this to happen, there must be a routing table entry allowing a subnet to access IGW. That subnet is called a **public subnet**. On the other hand, if a subnet has a routing table entry to access a NAT Gateway, that subnet is called a **private subnet.**

A **NAT Gateway** does something similar, but with two main differences:

- It allows resources in a private subnet to access the Internet (think software updates, external DB connections, wget calls etc.).
- It only works one way. The internet at large cannot get through your NAT unless you explicitly allow it.

#### Blueprint for VPC with public and private subnets (NAT)

![img](/Users/yeer/Downloads/vpc-blueprint.png)

The configuration for this blueprint includes the following:

- A VPC with a size /16 IPv4 CIDR block (e.g. 10.0.0.0/16)

- A public subnet with a size /24 IPv4 CIDR block (e.g. 10.0.0.0/24)

- A private subnet with a size /24 IPv4 CIDR block (e.g. 10.0.1.0/24)

- An Internet gateway

- A NAT gateway

- Instances in private subnet

- Instances in public subnet

- Route table associated with public subnet

  - Contains entry to enable instances in subnet to access internet via IGW
  - Contains entry to enable instances in subnet to communicate with other instances in VPC

- Route table associated with private subnet

  - Contains entry to enable instances in subnet to send requests to the Internet through NAT gateway
  - Contains entry to enable instances in subnet to communicate with other instances in VPC
  - Contains entry to enable instances in subnet to communicate with another VPC (VPC peering)

### Design Principles

#### Security

As security groups are the first line of defense for our EC2 instances, we follow the principle of least privilege by being extremely restrictive of what ports are open to all incoming connections. In general, if you use ELBs, ALBs or other load balancing, the only ports that need to be open to incoming traffic would be port 22 (for SSH access) and whatever port your application uses. Security groups access policy is 'deny by default'.

Consider using other security groups as sources for security group rules instead of using CIDRs — that way, all hosts in the source security group and only hosts in that security group are allowed access. This is a much more dynamic and secure way of managing security group rules.

Refer to this document for more detail: https://d1.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf

#### Modularity

VPCs provide logical isolation for your AWS resources. When it comes to choosing whether to group resources into a VPC or not, we follow these guidelines:

- Do they perform the same nature of tasks?
- Do they communicate with each other often? Please note that data transfer between VPCs are not free.
- Are they either internal-facing or public-facing? Internal-facing and public-facing resources may require [different VPC topologies](https://aws.amazon.com/answers/networking/aws-single-vpc-design/).

For each VPC, we will have two versions - one for staging environment and one for production environment.

When choosing CIDR blocks for subnets, please take care not to overlap them within the region and between existing regions (if you have more than one region). 

#### Fault-Tolerance

To achieve fault-tolerance, we span each VPC over multiple Availability Zones (AZs). This should not be an afterthought, and must be baked right in when designing the VPC topology.

References:

https://medium.com/aws-activate-startup-blog/practical-vpc-design-8412e1a18dcc

https://aws.amazon.com/answers/networking/aws-single-vpc-design/

https://www.softnas.com/wp/blog-aws-vpc-best-practices/

### Detailed Design and Implementation

#### CIDR Blocks

**General structure**

Staging VPC: 10.XX0.0.0/16:

- Public subnet (AZ A): 10.XX0.11.0/24
- Public subnet (AZ B): 10.XX0.12.0/24
- Private subnet (AZ A): 10.XX0.1.0/24
- Private subnet (AZ B): 10.XX0.2.0/24

Production VPC: 10.XX.0.0/16:

- Public subnet (AZ A): 10.XX.11.0/24
- Public subnet (AZ B): 10.XX.12.0/24
- Private subnet (AZ A): 10.XX.1.0/24
- Private subnet (AZ B): 10.XX.2.0/24

XX can be any number from 00 to 25 as long as they don’t clash with existing CIDR blocks among all regions. Currently, the CIDR blocks used in SG region are:

| builders-vpc-production      | 10.20.0.0/16  |      |
| ---------------------------- | ------------- | ---- |
| production-vpc               | 10.0.0.0/16   |      |
| metasearch-vpc-production    | 10.10.0.0/16  |      |
| proxies-vpc-staging          | 10.180.0.0/16 |      |
| micro-srv-vpc-staging        | 10.150.0.0/16 |      |
| wego-lambda-vpc              | 10.0.0.0/16   |      |
| proxies-vpc-production       | 10.18.0.0/16  |      |
| proxies-admin-vpc-production | 10.19.0.0/16  |      |
| builders-vpc-staging         | 10.250.0.0/16 |      |
| sap-vpc                      | 10.8.0.0/16   |      |
| vpn                          | 10.8.0.0/16   |      |
| proxies-admin-vpc-staging    | 10.190.0.0/16 |      |
| micro-srv-vpc-production     | 10.50.0.0/16  |      |
| meta-stg-vpc-staging         | 10.100.0.0/16 |      |
| databases-vpc-staging        | 10.160.0.0/16 |      |
| databases-vpc-production     | 10.16.0.0/16  |      |

For the Mumbai region, we follow a simple way to decide the IP ranges for each VPC. Since we have 4 VPCs, we start XX at 11 and increment it until we reach XX = 14.

#### Services VPC

![img](https://lh5.googleusercontent.com/owRHqqkIUGixh3khzUpGt3wSxqwwSZ5_TngtJye94D_A8qCoGkeu7FlByHW2EJsoQz13IQmvxMAJ7k-YBhAEfl6pESH_cShWq074RRjENM0m_GNuOMHXeeoug5TXotHxlbksFmFd)

**VPC CIDR Blocks**

| Region         | Env        | Subnet                | Subnet CIDR    | VPC CIDR      |
| -------------- | ---------- | --------------------- | -------------- | ------------- |
| ap-south-1     | staging    | Public subnet (AZ A)  | 10.110.11.0/24 | 10.110.0.0/16 |
| ap-south-1     | staging    | Public subnet (AZ B)  | 10.110.12.0/24 |               |
| ap-south-1     | staging    | Private subnet (AZ A) | 10.110.1.0/24  |               |
| ap-south-1     | staging    | Private subnet (AZ B) | 10.110.2.0/24  |               |
| ap-south-1     | production | Public subnet (AZ A)  | 10.11.11.0/24  | 10.11.0.0/16  |
| ap-south-1     | production | Public subnet (AZ B)  | 10.11.12.0/24  |               |
| ap-south-1     | production | Private subnet (AZ A) | 10.11.1.0/24   |               |
| ap-south-1     | production | Private subnet (AZ B) | 10.11.2.0/24   |               |
| ap-southeast-1 | staging    | Public subnet (AZ A)  | 10.210.11.0/24 | 10.210.0.0/16 |
| ap-southeast-1 | staging    | Public subnet (AZ B)  | 10.210.12.0/24 |               |
| ap-southeast-1 | staging    | Private subnet (AZ A) | 10.210.1.0/24  |               |
| ap-southeast-1 | staging    | Private subnet (AZ B) | 10.210.2.0/24  |               |
| ap-southeast-1 | production | Public subnet (AZ A)  | 10.21.11.0/24  | 10.21.0.0/16  |
| ap-southeast-1 | production | Public subnet (AZ B)  | 10.21.12.0/24  |               |
| ap-southeast-1 | production | Private subnet (AZ A) | 10.21.1.0/24   |               |
| ap-southeast-1 | production | Private subnet (AZ B) | 10.21.2.0/24   |               |

**Route Tables**

Public subnet:

| **Destination** | **Region**     | **Env**    | **Target** |
| --------------- | -------------- | ---------- | ---------- |
| 10.110.0.0/16   | ap-south-1     | staging    | local      |
| 10.11.0.0/16    | ap-south-1     | production |            |
| 10.210.0.0/16   | ap-southeast-1 | staging    |            |
| TODO            | ap-southeast-1 | production |            |
| 0.0.0.0/0       |                |            | igw-id     |

Private subnet:

| **Destination**                                    | **Target**                    |
| -------------------------------------------------- | ----------------------------- |
| 10.110.0.0/16 (staging)OR10.11.0.0/16 (production) | local                         |
| 0.0.0.0/0                                          | nat-gateway-id                |
| 10.120.0.0/16 (staging)OR10.12.0.0/16 (production) | services-databases-vpc-pcx-id |
| 10.130.0.0/16 (staging)OR10.13.0.0/16 (production) | services-builders-vpc-pcx-id  |

| **Destination** | **Region**     | **Env**    | **Target**                    |
| --------------- | -------------- | ---------- | ----------------------------- |
| 10.110.0.0/16   | ap-south-1     | staging    | local                         |
| 10.11.0.0/16    | ap-south-1     | production |                               |
| 10.210.0.0/16   | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 10.120.0.0/16   | ap-south-1     | staging    | services-databases-vpc-pcx-id |
| 10.12.0.0/16    | ap-south-1     | production |                               |
| TODO            | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 10.130.0.0/16   | ap-south-1     | staging    | services-builders-vpc-pcx-id  |
| 10.13.0.0/16    | ap-south-1     | production |                               |
| TODO            | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 0.0.0.0/0       |                |            | nat-gateway-id                |

**Security Groups**

Inbound rules for proxies ELB:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 443        | 0.0.0.0/0 |

Outbound rules for proxies ELB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for proxies:

| Protocol | Port range | Source            |
| -------- | ---------- | ----------------- |
| tcp      | 22         | builders-sg-id    |
| tcp      | 8000       | proxies-elb-sg-id |

Outbound rules for proxies:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for proxies admin ELB:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 443        | 0.0.0.0/0 |

Outbound rules for proxies admin ELB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for proxies admin:

| Protocol | Port range | Source                  |
| -------- | ---------- | ----------------------- |
| tcp      | 22         | builders-sg-id          |
| tcp      | 8010       | proxies-admin-elb-sg-id |

Outbound rules for proxies admin:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for ALB:

| Protocol | Port range | Source        |
| -------- | ---------- | ------------- |
| tcp      | 80         | proxies-sg-id |

Outbound rules for ALB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for metasearch services:

| Protocol | Port range            | Source         |
| -------- | --------------------- | -------------- |
| tcp      | 22                    | builders-sg-id |
| tcp      | [Java app port range] | alb-sg-id      |

Outbound rules for metasearch services:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for microservices:

| Protocol | Port range             | Source         |
| -------- | ---------------------- | -------------- |
| tcp      | 22                     | builders-sg-id |
| tcp      | [Rails app port range] | alb-sg-id      |

Outbound rules for microservices:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for Redis cluster:

| Protocol | Port range         | Source           |
| -------- | ------------------ | ---------------- |
| tcp      | 22                 | builders-sg-id   |
| tcp      | [Redis port range] | metasearch-sg-id |

Outbound rules for Redis cluster:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

#### Databases VPC

![img](/Users/yeer/Downloads/database-vpc.png)

**VPC CIDR Blocks**

| Region         | Env        | Subnet                | Subnet CIDR    | VPC CIDR      |
| -------------- | ---------- | --------------------- | -------------- | ------------- |
| ap-south-1     | staging    | Public subnet (AZ A)  | 10.120.11.0/24 | 10.120.0.0/16 |
| ap-south-1     | staging    | Public subnet (AZ B)  | 10.120.12.0/24 |               |
| ap-south-1     | staging    | Private subnet (AZ A) | 10.120.1.0/24  |               |
| ap-south-1     | staging    | Private subnet (AZ B) | 10.120.2.0/24  |               |
| ap-south-1     | production | Public subnet (AZ A)  | 10.12.11.0/24  | 10.12.0.0/16  |
| ap-south-1     | production | Public subnet (AZ B)  | 10.12.12.0/24  |               |
| ap-south-1     | production | Private subnet (AZ A) | 10.12.1.0/24   |               |
| ap-south-1     | production | Private subnet (AZ B) | 10.12.2.0/24   |               |
| ap-southeast-1 | staging    | Public subnet (AZ A)  | 10.160.11.0/24 | 10.160.0.0/16 |
| ap-southeast-1 | staging    | Public subnet (AZ B)  | 10.160.12.0/24 |               |
| ap-southeast-1 | staging    | Private subnet (AZ A) | 10.160.1.0/24  |               |
| ap-southeast-1 | staging    | Private subnet (AZ B) | 10.160.2.0/24  |               |
| ap-southeast-1 | production | Public subnet (AZ A)  | 10.16.11.0/24  | 10.16.0.0/16  |
| ap-southeast-1 | production | Public subnet (AZ B)  | 10.16.12.0/24  |               |
| ap-southeast-1 | production | Private subnet (AZ A) | 10.16.1.0/24   |               |
| ap-southeast-1 | production | Private subnet (AZ B) | 10.16.2.0/24   |               |

**Route Tables**

Public subnet:

| **Destination** | **Region**     | **Env**    | **Target** |
| --------------- | -------------- | ---------- | ---------- |
| 10.120.0.0/16   | ap-south-1     | staging    | local      |
| 10.12.0.0/16    | ap-south-1     | production |            |
| 10.160.0.0/16   | ap-southeast-1 | staging    |            |
| 10.16.0.0/16    | ap-southeast-1 | production |            |
| 0.0.0.0/0       |                |            | igw-id     |

Private subnet:

| **Destination** | **Region**     | **Env**    | **Target**                    |
| --------------- | -------------- | ---------- | ----------------------------- |
| 10.120.0.0/16   | ap-south-1     | staging    | local                         |
| 10.12.0.0/16    | ap-south-1     | production |                               |
| 10.160.0.0/16   | ap-southeast-1 | staging    |                               |
| 10.16.0.0/16    | ap-southeast-1 | production |                               |
| 10.110.0.0/16   | ap-south-1     | staging    | services-databases-vpc-pcx-id |
| 10.11.0.0/16    | ap-south-1     | production |                               |
| TODO            | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 0.0.0.0/0       | ap-southeast-1 |            | nat-gateway-id                |

**Security Groups**

Inbound rules for Elasticsearch instances:

| Protocol | Port range | Source              |
| -------- | ---------- | ------------------- |
| tcp      | 443        | microservices-sg-id |

Outbound rules for Elasticsearch instances:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for ElastiCache (Redis) instances:

| Protocol | Port range | Source           |
| -------- | ---------- | ---------------- |
| tcp      | 6379       | metasearch-sg-id |

Outbound rules for ElastiCache (Redis) instances:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for RDS (MySQL) instances:

| Protocol | Port range | Source     |
| -------- | ---------- | ---------- |
| tcp      | MySQL port | 10.0.0.0/8 |

Inbound rules for RDS (Postgres) instances:

| Protocol | Port range    | Source     |
| -------- | ------------- | ---------- |
| tcp      | Postgres port | 10.0.0.0/8 |

Outbound rules for all RDS instances:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

#### Builders VPC

![img](/Users/yeer/Downloads/builder-vpc.png)

**VPC CIDR Blocks**

Staging VPC: 10.130.0.0/16:

- Public subnet (AZ A): 10.130.11.0/24
- Public subnet (AZ B): 10.130.12.0/24
- Private subnet (AZ A): 10.130.1.0/24
- Private subnet (AZ B): 10.130.2.0/24

Production VPC: 10.13.0.0/16

- Public subnet (AZ A): 10.13.11.0/24
- Public subnet (AZ B): 10.13.12.0/24
- Private subnet (AZ A): 10.13.1.0/24
- Private subnet (AZ B): 10.13.2.0/24

**Route Tables**

Public subnet:

| **Destination**                                    | **Target** |
| -------------------------------------------------- | ---------- |
| 10.130.0.0/16 (staging)OR10.13.0.0/16 (production) | local      |
| 0.0.0.0/0                                          | igw-id     |

Private subnet:

| **Destination**                                    | **Target**                    |
| -------------------------------------------------- | ----------------------------- |
| 10.130.0.0/16 (staging)OR10.13.0.0/16 (production) | local                         |
| 0.0.0.0/0                                          | nat-gateway-id                |
| 10.110.0.0/16 (staging)OR10.11.0.0/16 (production) | services-builders-vpc-pcx-id  |
| 10.140.0.0/16 (staging)OR10.14.0.0/16 (production) | blackhole-builders-vpc-pcx-id |

**Security Groups**

Inbound rules for builders ELB:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 443        | 0.0.0.0/0 |

Outbound rules for builders ELB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for builders:

| Protocol | Port range | Source             |
| -------- | ---------- | ------------------ |
| tcp      | 22         | blackhole-sg-id    |
| tcp      | 8080       | builders-elb-sg-id |

Outbound rules for builders:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

#### Blackhole VPC

![img](/Users/yeer/Downloads/blackhole-vpc.png)

**VPC CIDR Blocks**

| Region         | Env        | Subnet                | Subnet CIDR    | VPC CIDR      |
| -------------- | ---------- | --------------------- | -------------- | ------------- |
| ap-south-1     | staging    | Public subnet (AZ A)  | 10.140.11.0/24 | 10.140.0.0/16 |
| ap-south-1     | staging    | Public subnet (AZ B)  | 10.140.12.0/24 |               |
| ap-south-1     | staging    | Private subnet (AZ A) | 10.140.1.0/24  |               |
| ap-south-1     | staging    | Private subnet (AZ B) | 10.140.2.0/24  |               |
| ap-south-1     | production | Public subnet (AZ A)  | 10.14.11.0/24  | 10.14.0.0/16  |
| ap-south-1     | production | Public subnet (AZ B)  | 10.14.12.0/24  |               |
| ap-south-1     | production | Private subnet (AZ A) | 10.14.1.0/24   |               |
| ap-south-1     | production | Private subnet (AZ B) | 10.14.2.0/24   |               |
| ap-southeast-1 | staging    | Public subnet (AZ A)  | 10.170.11.0/24 | 10.170.0.0/16 |
| ap-southeast-1 | staging    | Public subnet (AZ B)  | 10.170.12.0/24 |               |
| ap-southeast-1 | staging    | Private subnet (AZ A) | 10.170.1.0/24  |               |
| ap-southeast-1 | staging    | Private subnet (AZ B) | 10.170.2.0/24  |               |
| ap-southeast-1 | production | Public subnet (AZ A)  | 10.17.11.0/24  | 10.17.0.0/16  |
| ap-southeast-1 | production | Public subnet (AZ B)  | 10.17.12.0/24  |               |
| ap-southeast-1 | production | Private subnet (AZ A) | 10.17.1.0/24   |               |
| ap-southeast-1 | production | Private subnet (AZ B) | 10.17.2.0/24   |               |

**Route Tables**

Public subnet:

| **Destination** | **Region**     | **Env**    | **Target**                     |
| --------------- | -------------- | ---------- | ------------------------------ |
| 10.140.0.0/16   | ap-south-1     | staging    | local                          |
| 10.14.0.0/16    | ap-south-1     | production |                                |
| 10.170.0.0/16   | ap-southeast-1 | staging    |                                |
| 10.17.0.0/16    | ap-southeast-1 | production |                                |
| 10.160.0.0/16   | ap-southeast-1 | staging    | blackhole-databases-vpc-pcx-id |
| TODO            | ap-southeast-1 | production |                                |
| 10.130.0.0/16   | ap-south-1     | staging    | blackhole-builders-vpc-pcx-id  |
| 10.13.0.0/16    | ap-south-1     | production |                                |
| 0.0.0.0/0       |                |            | igw-id                         |

**Security Groups**

Inbound rules for bastion host:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 22         | 0.0.0.0/0 |
| icmp     | 0-8        | 0.0.0.0/0 |

Outbound rules for bastion host:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Reference: https://gist.github.com/charity/beb44266cadfd935ab6a838bfe917f38

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

### Terraform codebase structure

Instead of creating separate directories for production and staging environments, we can use Terraform workspace to manage small differences between each environment. Read more: https://www.terraform.io/docs/state/workspaces.html

EDIT: I tried Terraform workspaces and decided it is not suitable for our use case since we have to do a lot ternary if-else conditions in interpolated strings, which do not work with list values. Hence, it’s better to separate out the environments by directory structure instead.

```
terraform/
- aws
- - mumbai
  - - common
    - - main.tf
      - - define S3 and IAM setup
      - state.tf
      - - store common TF state in S3
    - vpc
    - - main.tf
      - - define all VPCs by calling vpc module
      - state.tf
      - - store vpc TF state in S3
      - security-groups.tf
      - - define all security groups and their references to each other
      - peerings.tf
      - - define all VPC peering connections
      - outputs.tf
      - - services_vpc_id
        - builders_vpc_id
        - databases_vpc_id
        - blackhole_vpc_id
        - <IDs of various security groups>
    - services
    - - main.tf
      - - call modules with env-specific vars for proxies, proxies-admin, metasearch, microservices, redis-dynamic 
      - state.tf
      - - store services TF state in S3
    - builders
    - - main.tf
      - - call module with env-specific vars for builders
      - state.tf
      - - store builders TF state in S3
    - blackhole
    - - main.tf
      - - call module with env-specific vars for blackhole
      - state.tf
      - - store blackhole TF state in S3
    - databases
    - - main.tf
      - - call modules with env-specific vars for postgres, mysql, elasticsearch, elasticache
      - state.tf
      - - store databases TF state in S3
  - singapore
  - - common
    - vpc
    - services
    - data-storage
  - modules
  - - vpc
    - - main.tf
      - variables.tf
      - - azs
        - vpc_cidr 
        - private_subnets 
        - public_subnets
      - outputs.tf 
      - - vpc_id
        - vpc_cidr
        - public_subnet_ids
        - public_route_table_ids
        - private_subnet_ids
        - private_route_table_ids
    - microservices
    - - main.tf
      - variables.tf
    - metasearch
    - - main.tf
      - variables.tf
    - proxies
    - - main.tf
      - variables
    - proxies-admin
    - - main.tf
      - variables.tf
    - builders
    - - main.tf
      - variables.tf
    -  blackhole
    - - main.tf
      - variables.tf
    - mysql-rds
    - - main.tf
      - variables.tf
    - postgres-rds
    - - main.tf
      - variables.tf
    - elasticsearch
    - - main.tf
      - variables.tf
    - redis-static
    - - main.tf
      - variables.tf
    - redis-dynamic
    - - main.tf
      - variables.tf
```
### Multi-region concerns

For RDS instances, we can create cross-region read replicas: https://aws.amazon.com/rds/details/read-replicas/

For ElastiCache instances, we need to create a separate cluster in each region as cross-region support is not supported. Same for Elasticsearch

### Stuff that we missed

Consul servers in builders VPC? It is no longer needed as a dependency.

Turingery proxy servers in services VPC? Use NAT gateway

As inter-region VPC peering is supported for Asia, there are some changes:

- Instead of one Konga for each region, we can have one Konga to manage all Kongs across regions
- Instead of having another blackhole in the new region, we can do VPC peering from the blackhole VPC in SG region to the builders VPC in the other region

### Multi-region Deployment Pipeline

Currently, we have two deployment pipelines for metasearch - one for deploying core features and the other for deploying partner integrations. The former generally involves more breaking changes that require a safer deployment strategy.

Hence, I propose to apply Immutable Infrastructure pattern to only the deployment pipeline of core features (for now).

Right now, Jenkins is used for build and deployment. To apply the Immutable Infrastructure pattern, we should use Jenkins only for the build phase and introduce a new tool - Spinnaker - for the deployment phase.

**Comparison with current (Jenkins) and new (Spinnaker + Jenkins) deployment pipelines**

The current deployment pipeline is as follows:

1. Jenkins pulls the latest source code, builds the JAR artifact and uploads it to S3
2. Jenkins ssh into every instance, downloads the JAR artifact and restarts the service

The new deployment pipeline will be:

1. Jenkins pulls the latest source code, builds the JAR artifact and uploads it to S3
2. Spinnaker will bake a new AMI with the JAR artifact, calls the AWS API to orchestrate various deployment strategies with ASG and ELB.

| **Factor**                      | **Current deployment pipeline**                              | **New deployment pipeline**                                  |
| ------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Immutability                    | Mutable deployments                                          | Immutable deployments                                        |
| Deployment time                 | Deployment time is shorter when deploying 1 instance because AMI doesn’t need to be built. However, the deployment time is linear to the number of instances. Our current deployment strategy is that we put each instance in standby mode one by one, hence deployment time is linear. This doesn’t scale if we have > 50 instances. | Deployment time is longer when deploying 1 instance because AMI needs to be built. However, the deployment time is constant regardless of the number of instances. Regardless of how many instances we have in the new cluster, we propagate the new AMIs to each instance in parallel, hence the deployment time is constant. |
| Autoscaling time                | Autoscaling is slower because Ansible scripts are ran for each fresh instance to prepare it for deployment. | Autoscaling is faster because the new instance just needs to be booted with the existing AMI. |
| Engineering cost                | Jenkins is a familiar technology and easy to use, no need to train developers. | Spinnaker is a relatively new technology, need time to train the developers. Requires engineering time to modify existing pipeline to support the Spinnaker workflow (converting artifacts into Debian package etc.) |
| Multi-region deployment         | Multi-region deployment is possible but hard to execute. Using Consul as service discovery, we can deploy all servers across regions but it will be messy to troubleshoot when the deployment fails. | Multi-region deployments are supported out of the box by Spinnaker. |
| Developer experience            | Have to go back and forth the AWS console and Jenkins UI for troubleshooting/checking of instance status especially when deployed instances are in different regions. | Spinnaker provides an one-stop interface to track the progress of deployment pipeline by displaying data from Jenkins and AWS. Destroying, resizing ASG can be performed via Spinnaker as well. |
| Support for deployment patterns | We have to write our own Ansible scripts to apply deployment patterns like blue-green. Those deployment scripts have to be maintained by us. | Battle-tested deployment strategies are supported out of the box: highlander, blue-green, canary etc. |
| Support for rollbacks           | Have to develop our own solutions for rollbacks.             | Rollbacks are supported out of the box.                      |
| Support for custom pipelines    | We can create custom pipelines in Jenkins however the UI won’t be as intuitive as Spinnaker. | In Spinnaker, a deployment pipeline consists of stages. We can craft custom pipelines for various scenarios. For example, a commit in integrations repository will trigger a simple pipeline to deploy using the highlander strategy. On the other hand, a big PR merge in Curiosity/Akasha will trigger a complex pipeline to perform integration & performance testing, which then requires manual approval before a blue-green deployment is executed. |