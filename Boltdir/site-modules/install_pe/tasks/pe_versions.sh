#!/bin/sh

year=$PT_year

# generate a temp file with a random part in the name
version_file="/tmp/pe-versions-`date +'%s%m%y'`.txt"

# All the PE versions are maintained in an online file. Download it to a temp file
curl -s http://versions.puppet.com.s3-website-us-west-2.amazonaws.com/ > $version_file

echo -n "Puppet Enterprise versions released in Year $year :"
# grep all the versions in that year.
values=$(grep $year $version_file)
if [ -z $values ]; then
    echo " Zero matches"
else
    echo ""
    echo $values
fi
# delete the temp file
unlink $version_file
