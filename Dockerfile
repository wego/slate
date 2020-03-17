FROM ruby:2.6.5 as builder

RUN apt-get update && \
    apt-get install -y nodejs vim locales && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN gem install bundler --version '2.0.2'

COPY ./Gemfile /usr/src/app/
COPY ./Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app
COPY . /usr/src/app
VOLUME /usr/src/app/source

RUN bundle install && bundle exec middleman build

FROM ruby:2.6.5 as uploader

RUN apt-get update && \
    apt-get install -y curl


RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /root/awscliv2.zip && \
      unzip /root/awscliv2.zip -d /root && \
      /root/aws/install

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

WORKDIR /app

COPY --from=builder /usr/src/app/build .

CMD aws s3 sync . s3://wego-docs/api

FROM nginx:1.17 as application

COPY --from=builder /usr/src/app/build /usr/share/nginx/html

