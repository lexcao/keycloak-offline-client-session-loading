#!/bin/sh

# Login with offline_access scope
function login() {
curl -s -L -X \
  POST 'http://localhost:8080/auth/realms/master/protocol/openid-connect/token' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'client_id=account' \
  --data-urlencode 'grant_type=password' \
  --data-urlencode 'scope=offline_access' \
  --data-urlencode "username=user" \
  --data-urlencode 'password=123'
}

function refresh() {
curl -s -L -X \
   POST 'http://localhost:8080/auth/realms/master/protocol/openid-connect/token' \
     -H 'Content-Type: application/x-www-form-urlencoded' \
     --data client_id=account \
     --data grant_type=refresh_token \
     --data refresh_token=$1
}


echo "LOGIN ..."
REFRESH_TOKEN=$(login | jq -r .refresh_token)
echo "LOGIN again..."
REFRESH_TOKEN_again=$(login)

echo "Refresh token with first logged in refresh token"
echo $(refresh "$REFRESH_TOKEN") | jq .
