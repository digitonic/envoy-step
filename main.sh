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

echo "[Envoy] Run command : $ENVOY_COMMAND"

run_cmd() {
        if eval "$@"; then
                exit 0
        else
                exit 1
        fi
}

run_cmd $ENVOY_COMMAND

echo "[Envoy] Completed!"
