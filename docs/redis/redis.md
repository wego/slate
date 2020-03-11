# Wego Redis Data Structure
Wego is using redis to store data that serves metasearch apis for hotel and flight. Data is catergorized into static and live data. Static data refer to ones that are not frequently changed or updated. Live data includes data that is dynamically fetched from providers such as flight fares and hotel rates. Data structures for static and live data are detailed respectively below:
- [Static Data](redis-static.md)
- [Live Data](redis-live.md)
