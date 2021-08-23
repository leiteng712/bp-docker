#!/bin/bash
echo "####################启动####################"
#hadoop
if [ "$HOSTNAME" = 'master' ]; then
  cluster.sh start
fi
