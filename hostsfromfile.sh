#!/bin/bash
echo Drag ABP list file onto terminal then hit enter.
read list
temp=$(basename $list .txt)
mkdir $temp
cp $list $temp/
./hostsblock $list* > $temp/hosts
echo "## By https://github.com/PwnArt1st/hostsblock"| cat - $temp/hosts > /tmp/out && mv /tmp/out $temp/hosts
echo "## Generated at" $(date)| cat - $temp/hosts > /tmp/out && mv /tmp/out $temp/hosts
echo Converted to $temp/hosts