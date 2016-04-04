#!/bin/sh
#
# Download postresql source to ../src/. i.e.:
#
# wget https://ftp.postgresql.org/pub/source/v9.5.2/postgresql-9.5.2.tar.bz2
# md5sum -c postgresql-9.5.2.tar.bz2.md5 
# tar -xjf postgresql-9.5.2.tar.bz2
# 

set -ex

ver=9.5.2
module_home=$HOME/modules
prefix=$module_home/local/postgresql/$ver
cd $module_home/src/postgresql-$ver

module purge
module load binutils/2.23-gcc48-rhel
export CC=gcc


# compile to local

./configure --prefix=$prefix
make
make install
$prefix/bin/psql test

