@echo off
REM This script assumes you have cURL installed and in your search path. If not you need to update lines starting with "curl" to point it to the executable path
REM The second assumption is that 7zip is installed in "C:\Program Files\7-Zip\". If not, the unpacking command needs to be modified accordingly
REM A GeoIP directory will be created in the Wireshark settings directory, plus a temp directory for downloading and unpacking the database files. There is
REM little to no error handling here, so if something fails you'll probably see it on the command line anyway. Sorry. I'm lazy.
REM Oh, one last thing - the temp directory isn't cleaned up to avoid accidental deletes and shouldn't be a problem. 
REM 
REM Version 0.1
REM 22 Aug 2018, Jasper Bongertz, jasper@packet-foo.com
REM 
REM See also https://blog.packet-foo.com/2018/05/wireshark-geoip-resolution-setup-v2-0/

cd /D %userprofile%\AppData\Roaming\Wireshark
if not exist GeoIP (mkdir GeoIP)
cd GeoIP
if not exist Temp (mkdir Temp)
cd Temp

echo Fetching Geolite2-City
curl --output GeoLite2-City.tar.gz https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
echo Fetching Geolite2-Country
curl --output GeoLite2-Country.tar.gz https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz
echo Fetching Geolite2-ASN
curl --output GeoLite2-ASN.tar.gz https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz

echo Unpacking archives
"c:\Program Files\7-Zip\7z.exe" -y e GeoLite2*.gz && "c:\Program Files\7-Zip\7z.exe" -y e GeoLite2*.tar

echo Moving database files
move *.mmdb ..\
