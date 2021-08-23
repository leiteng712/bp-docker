#!/bin/bash
for host in node01 node02; do
  echo "========== $host =========="
  ssh root@$host "cd /opt/module/applog/; java -jar gmall2020-mock-log-2021-01-22.jar >/dev/null 2>&1 &"
done
