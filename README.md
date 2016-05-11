hostsblock
==========

Converts AdBlock Plus filter lists to hosts file entries

About
-----

hostsblock finds any domain-only blocking rules in an AdBlock Plus filter list
(e.g. of the form `||some.domain.com^`) and prints them as host file entries
for 0.0.0.0 (e.g. `0.0.0.0	some.domain.com`).

Standalone ad-blocking hosts files like http://someonewhocares.org/hosts/hosts
are good, but since ABP filter lists are far more common and frequently updated,
it's nice to have a tool to parse them.

Building
--------

    make

Usage
-----

    hostsblock list

If the list argument is `-`, hostsblock will read from stdin. For example,

    curl -s https://www.fanboy.co.nz/r/fanboy-ultimate.txt | hostsblock -

If you had your original hosts file at /etc/hosts~, you could fetch an AdBlock
list, read the hosts file entries from it with hostsblock, and concatenate the
original hosts file with the ad-blocking entries to create the actual hosts
file:

    curl -s https://www.fanboy.co.nz/r/fanboy-ultimate.txt | hostsblock - | cat /etc/hosts~ - > /etc/hosts
