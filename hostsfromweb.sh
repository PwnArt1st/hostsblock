#!/bin/bash
echo Paste an ABP list url then enter
read url
echo Downloading list...
wget --no-dns-cache -q -P temp $url
temp=$(basename temp/* .txt)
mkdir $temp
mv -f temp/* $temp
echo Downloaded to $temp/$temp
./hostsblock $temp/$temp* > $temp/hosts
echo "## By https://github.com/PwnArt1st/hostsblock"| cat - $temp/hosts > /tmp/out && mv /tmp/out $temp/hosts
echo "## Generated at" $(date)| cat - $temp/hosts > /tmp/out && mv /tmp/out $temp/hosts
echo Converted to $temp/hosts