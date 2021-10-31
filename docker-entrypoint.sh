#!/bin/sh

# Add user
/opt/jboss/keycloak/bin/add-user-keycloak.sh --user user --password 123

# Start
/opt/jboss/tools/docker-entrypoint.sh
