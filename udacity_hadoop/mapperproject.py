#!/usr/bin/python

# Format of each line is:
# date\ttime\tstore name\titem description\tcost\tmethod of payment
#
# We want elements 2 (store name) and 4 (cost)
# We need to write them out to standard output, separated by a tab

import sys

for line in sys.stdin:
    data = line.strip().split()
    if len(data) == 10:
        network_address, identity, username, time, timezone, url_action, url_address, url_protocol, status, bytes = data
        print "{0}\t{1}".format(url_address, status)

