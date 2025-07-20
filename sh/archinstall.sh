#!/bin/bash
source ../.env

# conf.json作成
cp ../tmpl/user_configuration.json.sample ../dep/conf.json
sed -i "s/HOSTNAME/${HOSTNAME}/" ../dep/conf.json

# creds.json作成
cp ../tmpl/user_credentials.json.sample ../dep/creds.json
sed -i "s/USER_NAME/${USER_NAME}/" ../dep/creds.json
sed -i "s/USER_PASS/${USER_PASS}/" ../dep/creds.json
sed -i "s/ROOT_PASSWORD/${ROOT_PASSWORD}/" ../dep/creds.json


