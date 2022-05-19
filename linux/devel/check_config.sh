#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
CURDIR=$(cd `dirname $0`; pwd)

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
    echo "$(${CURDIR}/../core/check_os_id.sh $1)"
}

#
GetSystemVersion()
{
    echo "$(${CURDIR}/../core/get_os_ver.sh)"
}

#
CheckPackageKitName()
{
	echo "$(${CURDIR}/../core/get_kit_name.sh)"
}


#
CheckHavePackageFromKit()
# $1 PACKAGE
{
	echo "$(${CURDIR}/../core/check_package.sh $1)"
}

#
CheckHavePackageFromWhich()
# $1 PACKAGE
{
	echo "$(${CURDIR}/../core/check_which.sh $1)"
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
                echo "pkgconfig"
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
            else
                echo "unixODBC-devel"
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
            else
                echo "sqlite-devel"
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
            else
                echo "openssl-devel"
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
            else
                echo "ffmpeg-devel"
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
            else
                echo "freeimage-devel"
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
            else
                echo "fuse-devel"
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
            else
                echo "NetworkManager-libnm-devel"
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
            else
                echo "lz4-devel"
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
            else
                echo "zlib-devel"
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
            else
                echo "libarchive-devel"
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
            else
                echo "libmodbus-devel"
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
            else
                echo "libusbx-devel"
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
            else
                echo "mosquitto-devel"
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
            else
                echo "hiredis-devel"
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
            else
                echo "json-c-devel"
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
            else
                echo "bluez-libs-devel"
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
            else
                echo "libblkid-devel"
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
            else
                echo "libcap-devel"
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
            else
                echo "fcgi-devel"
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
            else
                echo "systemd-devel"
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
            else
                echo "systemd-devel"
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
            else
                echo "libdmtx-devel"
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
            else
                echo "qrencode-devel"
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
            else
                echo "zbar-devel"
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
            else
                echo "ImageMagick-devel"
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
            else
                echo "librdkafka-devel"
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
            else
                echo "libuuid-devel"
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
    else 
        echo "1"
    fi
}

##
echo $(CheckHavePackage $1 $2)