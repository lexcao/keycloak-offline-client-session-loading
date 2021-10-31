# Offline client sessions is not loaded from db after evicted from cache

# Reproduce Steps

1. Start keycloak server

```
$ sh ./keycloak-start.sh
```

2. Run ./refresh-token.sh

```
$ sh ./refresh-token.sh
```

## The script does

1. Start a keycloak server with configured offline session cache size to 2 and offline client session cache size to 1
2. Log in by user with `offline_access` scope to get refresh token
3. Log in again the same as step 2
4. Use refresh token from step 2 to make a refresh grant
5. It happens 
