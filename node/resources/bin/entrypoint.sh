#!/bin/bash
# shellcheck disable=SC2164
cd "$WORK_DIR"/bin/
#节点初始化
node.sh

#组件初始化
if [ ! -e "initialized" ]; then
  init.sh
  touch initialized
fi

#启动
start.sh

#测试
#test.sh

exec "$@"
