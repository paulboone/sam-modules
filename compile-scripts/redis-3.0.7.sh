#!/bin/sh
#
# Download redis to ../src/. i.e.:
#
# wget http://download.redis.io/releases/redis-3.0.7.tar.gz
# tar -xzf redis-3.0.7.tar.gz

set -ex

ver=3.0.7
module_home=$HOME/modules
cd $module_home/src/redis-$ver


module purge
# module load python/anaconda-2.3.0-rhel
module load binutils/2.23-gcc48-rhel
export CC=gcc

# compile to local
make
make PREFIX=$module_home/local/redis/$ver install

