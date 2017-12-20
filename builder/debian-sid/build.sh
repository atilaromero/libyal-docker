#!/bin/bash -ex

: ${CONFIGURE_OPTIONS:? not set}

./autogen.sh
./configure ${CONFIGURE_OPTIONS}
make install
ldconfig
make dist-gzip
cp -rf dpkg debian
dpkg-buildpackage -b -us -uc -rfakeroot
