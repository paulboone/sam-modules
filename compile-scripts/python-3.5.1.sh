#!/bin/sh
#
# Download python source to ../src/. i.e.:
#
# wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz
# md5sum -c Python-3.5.1.tgz
# tar -xzf Python-3.5.1.tgz
#

# MD5=be78e48cdfc1a7ad90efff146dce6cfe
#
#
#

set -ex

ver=3.5.1
module_home=$HOME/modules
prefix=$module_home/local/python/$ver
cd $module_home/src/Python-$ver

module purge
module load binutils/2.23-gcc48-rhel

# compile to local
./configure --prefix=$prefix
make
# make test
make install

## ghetto-patch python's ctype command so the broken ldconfig implementation gets wrapped
## should be deleted when we move to the slurm cluster.
cd $prefix/lib/python3.5/ctypes/
patch < $module_home/patches/python-$ver/ctypes_ldconfig.patch
