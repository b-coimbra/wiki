#!/usr/bin/env python

import urllib, json

argu = input("What location?: ")
response = urllib.urlopen("http://maps.googleapis.com/maps/api/geocode/json?address=" + argu)
data = json.loads(response.read())
print data