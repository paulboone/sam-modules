#!/bin/sh
# From node README.md, we need:
# * `gcc` and `g++` 4.8 or newer, or
# * Python 2.6 or 2.7
#
# Download node to ../src/

set -ex

ver=5.7.0
module_home=$HOME/modules
cd $module_home/src/node-v$ver


module purge
module load python/anaconda-2.3.0-rhel
module load binutils/2.23-gcc48-rhel

# next line is needed to prevent node.js compile from attempting to use cc
export CC=gcc

# compile to local
./configure --prefix=$module_home/local/nodejs/$ver

make

# make install?
