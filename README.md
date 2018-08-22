# GeoIPDBUpdate

A small Windows script that downloads the latest MaxMind GeoIP databases and puts them into a folder called "GeoIP" in your Wireshark user settings directory. The script requires cURL and 7-Zip for downloading and extracting the .mmdb files. Wireshark needs to be configured to use the GeoIP directory in the Name Resolution preferences section.

More info about Wireshark and GeoIP setup here: https://blog.packet-foo.com/2018/05/wireshark-geoip-resolution-setup-v2-0/
