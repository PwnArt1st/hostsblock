#!/bin/bash
echo Drag ABP list file onto terminal then hit enter.
read list
./hostsblock $list > $list.hosts
echo Converted to $list.hosts