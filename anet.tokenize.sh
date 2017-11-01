#!/bin/bash 

URL=https://apitest.authorize.net/xml/v1/request.api
curl -s -v -X POST \
  -d @anet.tokenize.json \
  $URL
