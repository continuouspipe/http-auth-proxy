#!/bin/bash

set -xe

if [ -z "$HTTP_BACKEND" ]; then
    echo "The 'HTTP_BACKEND' variable have to be set"
    exit 1
fi

if [ -z "$HTTP_USERS" ]; then
    echo "The 'HTTP_USERS' variable have to be set"
    exit 1
fi

split_on_commas() {
  local IFS=,
  local WORD_LIST=($1)
  for word in "${WORD_LIST[@]}"; do
    echo "$word"
  done
}

touch /etc/nginx/.htpasswd
split_on_commas "$HTTP_USERS" | while read user; do
    USERNAME=`echo $user | cut -d \: -f 1`
    PASSWORD=`echo $user | cut -d \: -f 2`

    htpasswd -b /etc/nginx/.htpasswd $USERNAME $PASSWORD
done

# Update Nginx configucation
confd -onetime -backend env

exec nginx
