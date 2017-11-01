#!/bin/bash
URL=https://rmpaydev.routematch.com

TOKEN=$( 
  curl -s \
    -H 'Content-Type: application/json' \
    -d '{ "agency" : "agency-anet", "email": "rider1.gloria@home.com", "password":  "Password1" }' \
    $URL/auth/api/v4/authenticate | jq -r .id_token
)

echo $TOKEN

curl -s \
  -X POST \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer: $TOKEN" \
  $URL/pspaccount/api/v3/authorize

echo
echo

curl -s \
  -X POST \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer: $TOKEN" \
  -d '{"environment": "sandbox"}' \
  $URL/pspaccount/api/v3/transaction/details | jq -r . 

echo
