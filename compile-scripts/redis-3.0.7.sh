#!/bin/sh
#
# Download redis to ../src/. i.e.:
#
# wget http://download.redis.io/releases/redis-3.0.7.tar.gz
# tar -xzf redis-3.0.7.tar.gz

set -ex

ver=3.0.7
cd $SAM_MODULES_HOME/src/redis-$ver


module purge
module load binutils/2.25-gcc5.2.0
export CC=gcc

# compile to local
make
make PREFIX=$SAM_MODULES_HOME/local/redis/$ver install

