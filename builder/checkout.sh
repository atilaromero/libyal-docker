#!/bin/bash -ex

LIB_VER=${1}

if [ ${LIB_VER} == 'latest' ]
then
  LIB_VER=`git describe --tags --abbrev=0`
fi

if [ ${LIB_VER} != '' ]
then
  git checkout ${LIB_VER}
fi
