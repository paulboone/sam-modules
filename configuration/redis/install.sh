#!/bin/bash
#
# redis should already be installed in /usr/local/bin. try something like:
# cp ../../local/redis/3.0.7/bin/* /usr/local/bin/
#

set -ex

echo "redis must already be installed prior to this. see script for details."

cp ./redis.conf /etc/redis.conf
cp redis.init /etc/init.d/redis
chkconfig --add redis

