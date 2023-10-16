#!/bin/sh
set -e

version=${1:-v1}

wget "http://39.108.215.175/data/${version}.zip"
mkdir -p ${version}
unzip ${version}.zip -d ${version}
rm -rf ${version}.zip
