#!/bin/bash
URL=https://rmpaydev.routematch.com

echo "Acquire token"

TOKEN=$( 
  curl -s \
    -H 'Content-Type: application/json' \
    -d '{ "agency" : "agency-anet", "email": "rider1.gloria@home.com", "password":  "Password1" }' \
    $URL/auth/api/v4/authenticate | jq -r .id_token
)

echo "Token: $TOKEN"
echo
echo
echo "Hit payment svc"

curl -s \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer: $TOKEN" \
  -d @anet.json \
  $URL/payment/api/v4/purchase | jq -r . 

echo
exit 0
