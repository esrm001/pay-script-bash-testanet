#!/bin/bash
URL=https://rmpaydev.routematch.com

TOKEN=$( 
  curl -s \
    -H 'Content-Type: application/json' \
    -d '{ "agency" : "testagency", "email": "rider1.gloria@home.com", "password":  "password" }' \
    $URL/auth/api/v4/authenticate | jq -r .id_token
)

echo $TOKEN
echo
echo

curl -s \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer: $TOKEN" \
  -d @anet.json \
  $URL/payment/api/v4/purchase | jq -r . 

echo
exit 0
