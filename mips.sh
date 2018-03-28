#!/bin/sh
#

export OPENWRT_DIR=/home/caosx/work/y_openwrt_bb
export STAGING_DIR=${OPENWRT_DIR}/staging_dir
export PATH=${PATH}:${STAGING_DIR}/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin
export CROSS_COMPILE=mipsel-openwrt-linux-

TOPDIR=`pwd`
#export PROTOLIB=${TOPDIR}/protobuf-c-arm/lib
export PROTOLIB=${STAGING_DIR}/target-mipsel_24kec+dsp_uClibc-0.9.33.2/root-ramips/usr/lib
export TCLIB=/lib
export CC=${CROSS_COMPILE}gcc
export CFLAGS=-I${TOPDIR}
export STRIP=${CROSS_COMPILE}strip

echo "$PATH"
make clean
make
	 
mkdir ${TOPDIR}/bin
cp -vf ${TOPDIR}/output/release/lib/libiot_sdk.a ${TOPDIR}/bin/
cp -vf ${TOPDIR}/output/release/lib/libiot_tls.a ${TOPDIR}/bin/
cp -vf ${TOPDIR}/output/release/lib/libiot_platform.a ${TOPDIR}/bin/
cp -rvf ${TOPDIR}/output/release/include ${TOPDIR}/bin/ 

#${STRIP} ${TOPDIR}/bin/*
