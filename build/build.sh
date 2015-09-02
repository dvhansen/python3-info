#!/bin/bash

VERSION=3.4.3
DIR="Python-${VERSION}"
FILE="${DIR}.tgz"
URL="https://www.python.org/ftp/python/${VERSION}/${FILE}"

[ -f "${FILE}" ] || wget "${URL}"
[ -d "${DIR}" ] ||  tar zxf "${FILE}"

cd "${DIR}"/Doc

if [ ! -f Makefile.bak ]; then
    cp Makefile Makefile.bak
    patch -p2 < ../../python-"${VERSION}".patch
fi

make texinfo
cd ../../
