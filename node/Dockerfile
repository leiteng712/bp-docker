FROM centos

MAINTAINER leiteng <leiteng712@163.com>

# 工作空间
WORKDIR /opt
# 改变之后层的执行 RUN, CMD 以及 ENTRYPOINT 这类命令的身份
USER root

# 变量
ARG HADOOP_VERSION=hadoop-3.1.3
ARG JAVA_VERSION=jdk1.8.0_301
ARG ZOOKEEPER_VERSION=apache-zookeeper-3.5.7-bin
ARG KAFKA_VERSION=kafka_2.11-2.4.1
ARG FLUME_VERSION=apache-flume-1.9.0-bin

#工作空间地址
ENV WORK_DIR=/opt
#java
ENV JAVA_HOME=$WORK_DIR/$JAVA_VERSION
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#hadoop
ENV HADOOP_HOME=$WORK_DIR/$HADOOP_VERSION
#zookeeper
ENV ZOOKEEPER_HOME=$WORK_DIR/$ZOOKEEPER_VERSION
#kafka
ENV KAFKA_HOME=$WORK_DIR/$KAFKA_VERSION
#FLUME
ENV FLUME_HOME=$WORK_DIR/$FLUME_VERSION
#自建脚本
ENV PATH=$PATH:/opt/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin:$KAFKA_HOME/bin

# 添加文件
#hadoop
ADD resources/etc/Centos-8.repo /etc/yum.repos.d/CentOS-Base.repo
ADD resources/bin/ bin/
ADD resources/etc/env_base.sh /etc/profile.d/
ADD resources/etc/hosts .
ADD resources/hadoop/hadoop-3.1.3.tar.gz .
ADD resources/jdk/jdk-8u301-linux-x64.tar .
ADD resources/hadoop/etc/hadoop $HADOOP_VERSION/etc/hadoop
ADD resources/hadoop/sbin $HADOOP_VERSION/sbin
ADD resources/hadoop/lzo/hadoop-lzo-0.4.20.jar $HADOOP_VERSION/share/hadoop/common/
#日志
ADD resources/applog/log module/applog/
#zookeeper
ADD resources/zookeeper/apache-zookeeper-3.5.7-bin.tar.gz .
ADD resources/zookeeper/zoo.cfg $ZOOKEEPER_HOME/conf/
#kafka
ADD resources/kafka/kafka_2.11-2.4.1.tgz .
ADD resources/kafka/server.properties $KAFKA_HOME/config/
#flume
ADD resources/flume/apache-flume-1.9.0-bin.tar.gz .
ADD resources/flume/flume-env.sh $FLUME_HOME/conf/
ADD resources/flume/*.conf $FLUME_HOME/conf/
ADD resources/flume/flume-interceptor-1.0-SNAPSHOT-jar-with-dependencies.jar $FLUME_HOME/lib/

RUN \
    yum -y update && yum makecache && yum clean all  && yum -y install which openssh-server openssh-clients rsync && yum clean all && cd /usr/local/ && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key > /dev/null 2>&1 && ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key > /dev/null 2>&1 && ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key > /dev/null 2>&1 && mkdir ~/.ssh && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && sed -i "s/#PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config && echo "StrictHostKeyChecking no">>/etc/ssh/ssh_config && echo "UserKnownHostsFile /dev/null">>/etc/ssh/ssh_config && chmod 0600 ~/.ssh/authorized_keys && \
    rm -rf /opt/$HADOOP_VERSION/share/doc && rm -rf $ZOOKEEPER_HOME/docs && rm -rf $KAFKA_HOME/site-docs && \
    rm -rf $FLUME_HOME/docs && rm -rf $FLUME_HOME/lib/guava-*.jar && \
    chmod -R 755 /opt/bin/ && \
    chmod 755 /etc/profile.d/env_base.sh

ENTRYPOINT ["/opt/bin/entrypoint.sh"]

# 跑测试代码
CMD ["ping", "127.0.0.1"]
