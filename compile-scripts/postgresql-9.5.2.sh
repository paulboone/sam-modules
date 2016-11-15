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
prefix=$SAM_MODULES_HOME/local/postgresql/$ver
cd $SAM_MODULES_HOME/src/postgresql-$ver

module purge
module load binutils/2.25-gcc5.2.0
export CC=gcc

# compile to local
./configure --prefix=$prefix
make
make install
