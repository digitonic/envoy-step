#!/bin/bash

mkdir ~/.ssh

export PRIVATEKEY_PATH=`mktemp`

echo ${{PRIVATE_KEY}} | base64 -d > $PRIVATEKEY_PATH

eval `ssh-agent -s`

ssh-add $PRIVATEKEY_PATH

ssh-keyscan -H ${{INSTANCE_IP}} >> ~/.ssh/known_hosts

