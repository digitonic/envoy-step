#!/bin/bash

echo "[Envoy] Started"

mkdir -p ~/.ssh

export PRIVATEKEY_PATH=`mktemp`

echo $PRIVATE_KEY | base64 -d > $PRIVATEKEY_PATH

eval `ssh-agent -s`

ssh-add $PRIVATEKEY_PATH

echo "[Envoy] PRIVATE_KEY added to the ssh agent"

ssh-keyscan -H $INSTANCE_IP >> ~/.ssh/known_hosts

echo "[Envoy] IP address : $INSTANCE_IP added to the known_hosts"

env

echo "[Envoy] Run command : $ENVOY_COMMAND"

#sh -c `$ENVOY_COMMAND`

eval $ENVOY_COMMAND
