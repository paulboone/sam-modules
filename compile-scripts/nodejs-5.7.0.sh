#!/bin/sh
# From node README.md, we need:
# * `gcc` and `g++` 4.8 or newer, or
# * Python 2.6 or 2.7
#
# Download node to ../src/

set -ex

ver=5.7.0
cd $SAM_MODULES_HOME/src/node-v$ver


module purge
module load python/3.5.1
module load binutils/2.25-gcc5.2.0

# next line is needed to prevent node.js compile from attempting to use cc
export CC=gcc

# compile to local
./configure --prefix=$SAM_MODULES_HOME/local/nodejs/$ver

make
make install

