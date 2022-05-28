#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
SHELLDIR=$(cd `dirname $0`; pwd)

# Functions
checkReturnCode()
{
    rc=$?
    if [ $rc != 0 ];then
        exit $rc
    fi
}

#
CheckSystemName()
# $1 System Name
{
    echo "$(${SHELLDIR}/../core/check-os-id.sh $1)"
}

#
GetSystemVersion()
{
    echo "$(${SHELLDIR}/../core/get-os-ver.sh)"
}

#
CheckPackageKitName()
{
	echo "$(${SHELLDIR}/../core/get-kit-name.sh)"
}


#
CheckHavePackageFromKit()
# $1 PACKAGE
{
	echo "$(${SHELLDIR}/../core/check-package.sh $1)"
}

#
CheckHavePackageFromWhich()
# $1 PACKAGE
{
	echo "$(${SHELLDIR}/../core/check-which.sh $1)"
}

#
CheckHavePackage()
# $1 PKG_NAME
# $2 FLAG
{
    #
    SYS_VERID=$(GetSystemVersion)
    KIT_NAME=$(CheckPackageKitName)
    PKG_NAME="$1"
    FLAG="$2"

    #
	if [ "deb" == "${KIT_NAME}" ];then 
	{  
        if [ "${PKG_NAME}" == "pkgconfig" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromWhich pkg-config)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo ""
            else 
                echo "pkg-config"
            fi
        }
        elif [ "${PKG_NAME}" == "openmp" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libgomp1)"
            elif [ ${FLAG} -eq 2 ];then
                echo "-fopenmp"
            elif [ ${FLAG} -eq 3 ];then
                echo "-fopenmp"
            else
                echo "libgomp1"
            fi
        }
        elif [ "${PKG_NAME}" == "unixodbc" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit unixodbc-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo "-lodbc"
            else
                echo "unixodbc-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "sqlite" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libsqlite3-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags sqlite3)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs sqlite3)"
            else
                echo "libsqlite3-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "openssl" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libssl-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags openssl)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs openssl)"
            else
                echo "libssl-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "ffmpeg" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit "libswscale-dev libavutil-dev libavcodec-dev libavformat-dev libavdevice-dev")"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libswscale libavutil libavcodec libavformat libavdevice libavfilter libavresample libpostproc libswresample)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libswscale libavutil libavcodec libavformat libavdevice libavfilter libavresample libpostproc libswresample)"
            else
                echo "libswscale-dev libavutil-dev libavcodec-dev libavformat-dev libavdevice-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "freeimage" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libfreeimage-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo "-lfreeimage"
            else
                echo "libfreeimage-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "fuse" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libfuse-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags fuse)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs fuse)"
            else
                echo "libfuse-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "libnm" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libnm-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libnm)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libnm)"
            else
                echo "libnm-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "lz4" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit liblz4-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags liblz4)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs liblz4)"
            else
                echo "liblz4-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "zlib" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit zlib1g-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags zlib)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs zlib)"
            else
                echo "zlib1g-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "archive" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libarchive-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libarchive)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libarchive)"
            else
                echo "libarchive-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "modbus" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libmodbus-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libmodbus)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libmodbus)"
            else
                echo "libmodbus-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "libusb" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libusb-1.0-0-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libusb-1.0)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libusb-1.0)"
            else
                echo "libusb-1.0-0-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "mqtt" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libmosquitto-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo "-lmosquitto"
            else
                echo "libmosquitto-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "redis" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libhiredis-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags hiredis)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs hiredis)"
            else
                echo "libhiredis-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "json-c" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libjson-c-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags json-c)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs json-c)"
            else
                echo "libjson-c-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "bluez" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libbluetooth-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags bluez)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs bluez)"
            else
                echo "libbluetooth-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "blkid" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libblkid-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags blkid)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs blkid)"
            else
                echo "libblkid-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "libcap" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libcap-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libcap)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libcap)"
            else
                echo "libcap-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "fastcgi" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libfcgi-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo "-lfcgi"
            else
                echo "libfcgi-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "systemd" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libsystemd-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libsystemd)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libsystemd)"
            else
                echo "libsystemd-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "libudev" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libudev-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libudev)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libudev)"
            else
                echo "libudev-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "dmtx" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libdmtx-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libdmtx)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libdmtx)"
            else
                echo "libdmtx-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "qrencode" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libqrencode-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libqrencode)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libqrencode)"
            else
                echo "libqrencode-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "zbar" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libzbar-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags zbar)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs zbar)"
            else
                echo "libzbar-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "magickwand" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libmagickwand-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags MagickWand)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs MagickWand)"
            else
                echo "libmagickwand-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "kafka" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit librdkafka-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags rdkafka)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs rdkafka)"
            else
                echo "librdkafka-dev"
            fi
        }
        elif [ "${PKG_NAME}" == "uuid" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit uuid-dev)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags uuid)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs uuid)"
            else
                echo "uuid-dev"
            fi
        }
        else
        {
            if [ ${FLAG} -eq 1 ];then 
                echo "1"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo ""
            else
                echo "${PKG_NAME}"
            fi
        }
        fi
    }
	elif [ "rpm" == "${KIT_NAME}" ];then
	{
        if [ "${PKG_NAME}" == "pkgconfig" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromWhich pkg-config)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo ""
            else
                if [ ${SYS_VERID} -eq 7 ];then
                    echo "pkgconfig"
                elif [ ${SYS_VERID} -eq 8 ];then
                    echo "pkgconf-pkg-config"
                else 
                    echo ""
                fi
            fi
        }
        elif [ "${PKG_NAME}" == "openmp" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libgomp)"
            elif [ ${FLAG} -eq 2 ];then
                echo "-fopenmp"
            elif [ ${FLAG} -eq 3 ];then
                echo "-fopenmp"
            else
                echo "libgomp"
            fi
        }
        elif [ "${PKG_NAME}" == "unixodbc" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit unixODBC-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags odbc)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs odbc)"
            elif [ ${FLAG} -eq 4 ];then
                echo "unixODBC-devel"
            else 
                echo "unixODBC"
            fi
        }
        elif [ "${PKG_NAME}" == "sqlite" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit sqlite-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags sqlite3)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs sqlite3)"
            elif [ ${FLAG} -eq 4 ];then
                echo "sqlite-devel"
            else
                echo "sqlite"
            fi
        }
        elif [ "${PKG_NAME}" == "openssl" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit openssl-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags openssl)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs openssl)"
            elif [ ${FLAG} -eq 4 ];then
                echo "openssl-devel"
            else
                echo "openssl"
            fi
        }
        elif [ "${PKG_NAME}" == "ffmpeg" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit ffmpeg-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libswscale libavutil libavcodec libavformat libavdevice libavfilter libavresample libpostproc libswresample)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libswscale libavutil libavcodec libavformat libavdevice libavfilter libavresample libpostproc libswresample)"
            elif [ ${FLAG} -eq 4 ];then
                echo "ffmpeg-devel"
            else 
                echo "ffmpeg"
            fi
        }
        elif [ "${PKG_NAME}" == "freeimage" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit freeimage-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo "-lfreeimage"
            elif [ ${FLAG} -eq 4 ];then
                echo "freeimage-devel"
            else
                echo "freeimage"
            fi
        }
        elif [ "${PKG_NAME}" == "fuse" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit fuse-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags fuse)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs fuse)"
            elif [ ${FLAG} -eq 4 ];then
                echo "fuse-devel"
            else
                echo "fuse"
            fi
        }
        elif [ "${PKG_NAME}" == "libnm" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit NetworkManager-libnm-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libnm)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libnm)"
            elif [ ${FLAG} -eq 4 ];then
                echo "NetworkManager-libnm-devel"
            else
                echo "NetworkManager-libnm"
            fi
        }
        elif [ "${PKG_NAME}" == "lz4" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit lz4-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags liblz4)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs liblz4)"
            elif [ ${FLAG} -eq 4 ];then
                echo "lz4-devel"
            else
                echo "lz4"
            fi
        }
        elif [ "${PKG_NAME}" == "zlib" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit zlib-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags zlib)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs zlib)"
            elif [ ${FLAG} -eq 4 ];then
                echo "zlib-devel"
            else
                echo "zlib"
            fi
        }
        elif [ "${PKG_NAME}" == "archive" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libarchive-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libarchive)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libarchive)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libarchive-devel"
            else
                echo "libarchive"
            fi
        }
        elif [ "${PKG_NAME}" == "modbus" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libmodbus-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libmodbus)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libmodbus)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libmodbus-devel"
            else
                if [ ${SYS_VERID} -eq 7 ];then
                    echo "libmodbus"
                elif [ ${SYS_VERID} -eq 8 ];then
                    echo "libmodbus"
                else 
                    echo ""
                fi
            fi
        }
        elif [ "${PKG_NAME}" == "libusb" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libusbx-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libusb-1.0)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libusb-1.0)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libusbx-devel"
            else
                echo "libusbx"
            fi
        }
        elif [ "${PKG_NAME}" == "mqtt" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit mosquitto-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libmosquitto)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libmosquitto)"
            elif [ ${FLAG} -eq 4 ];then
                echo "mosquitto-devel"
            else
                echo "mosquitto"
            fi
        }
        elif [ "${PKG_NAME}" == "redis" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit hiredis-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags hiredis)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs hiredis)"
            elif [ ${FLAG} -eq 4 ];then
                echo "hiredis-devel"
            else
                echo "hiredis"
            fi
        }
        elif [ "${PKG_NAME}" == "json-c" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit json-c-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags json-c)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs json-c)"
            elif [ ${FLAG} -eq 4 ];then
                echo "json-c-devel"
            else
                echo "json-c"
            fi
        }
        elif [ "${PKG_NAME}" == "bluez" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit bluez-libs-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags bluez)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs bluez)"
            elif [ ${FLAG} -eq 4 ];then
                echo "bluez-libs-devel"
            else
                echo "bluez-libs"
            fi
        }
        elif [ "${PKG_NAME}" == "blkid" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libblkid-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags blkid)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs blkid)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libblkid-devel"
            else
                echo "libblkid"
            fi
        }
        elif [ "${PKG_NAME}" == "libcap" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libcap-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libcap)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libcap)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libcap-devel"
            else
                echo "libcap"
            fi
        }
        elif [ "${PKG_NAME}" == "fastcgi" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit fcgi-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo "-lfcgi"
            elif [ ${FLAG} -eq 4 ];then
                echo "fcgi-devel"
            else
                echo "fcgi"
            fi
        }
        elif [ "${PKG_NAME}" == "systemd" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit systemd-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libsystemd)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libsystemd)"
            elif [ ${FLAG} -eq 4 ];then
                echo "systemd-devel"
            else
                echo "systemd"
            fi
        }
        elif [ "${PKG_NAME}" == "libudev" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit systemd-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libudev)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libudev)"
            elif [ ${FLAG} -eq 4 ];then
                echo "systemd-devel"
            else
                echo "systemd"
            fi
        }
        elif [ "${PKG_NAME}" == "dmtx" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libdmtx-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libdmtx)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libdmtx)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libdmtx-devel"
            else
                echo "libdmtx"
            fi
        }
        elif [ "${PKG_NAME}" == "qrencode" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit qrencode-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags libqrencode)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs libqrencode)"
            elif [ ${FLAG} -eq 4 ];then
                echo "qrencode-devel"
            else
                echo "qrencode"
            fi
        }
        elif [ "${PKG_NAME}" == "zbar" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit zbar-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags zbar)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs zbar)"
            elif [ ${FLAG} -eq 4 ];then
                echo "zbar-devel"
            else
                echo "zbar"
            fi
        }
        elif [ "${PKG_NAME}" == "magickwand" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit ImageMagick-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags MagickWand)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs MagickWand)"
            elif [ ${FLAG} -eq 4 ];then
                echo "ImageMagick-devel"
            else
                echo "ImageMagick"
            fi
        }
        elif [ "${PKG_NAME}" == "kafka" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit librdkafka-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags rdkafka)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs rdkafka)"
            elif [ ${FLAG} -eq 4 ];then
                echo "librdkafka-devel"
            else
                echo "librdkafka"
            fi
        }
        elif [ "${PKG_NAME}" == "uuid" ];then
        {
            if [ ${FLAG} -eq 1 ];then
                echo "$(CheckHavePackageFromKit libuuid-devel)"
            elif [ ${FLAG} -eq 2 ];then
                echo "$(pkg-config --cflags uuid)"
            elif [ ${FLAG} -eq 3 ];then
                echo "$(pkg-config --libs uuid)"
            elif [ ${FLAG} -eq 4 ];then
                echo "libuuid-devel"
            else
                echo "libuuid"
            fi
        }
        else
        {
            if [ ${FLAG} -eq 1 ];then 
                echo "1"
            elif [ ${FLAG} -eq 2 ];then
                echo ""
            elif [ ${FLAG} -eq 3 ];then
                echo ""
            elif [ ${FLAG} -eq 4 ];then
                echo ""
            elif [ ${FLAG} -eq 5 ];then
                echo ""
            else 
                echo "${PKG_NAME}"
            fi
        }
        fi
    }
    else 
        echo "1"
    fi
}

##
echo $(CheckHavePackage $1 $2)