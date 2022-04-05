#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
SHELL_PATH=$(cd `dirname $0`; pwd)
SHELL_NAME=$(basename $0)

#
function make_default_conf()
{
cat > $1 << EOF
# OpenSSL CA configuration file

[ ca ]
default_ca = CA_default

# 签发下级证书时使用。
[ CA_default ]
# 
dir = ./$2
certs = \$dir/certs
crl_dir	= \$dir/crl
new_certs_dir = \$dir/newcerts
database = \$dir/conf.d/index.txt
serial = \$dir/conf.d/serial
crlnumber = \$dir/conf.d/crlnumber
crl = \$dir/pem.crl
certificate = \$dir/pem.crt
private_key = \$dir/private/pem.key
RANDFILE = \$dir/private/.rand
#
default_days = 365
default_crl_days= 30
default_md = sha256
copy_extensions = copy
unique_subject = no
policy = signing_policy

# 签发策略，签发下级证书时使用。
# 注：如果修改了此段域值，创建证书请求时则要根据此策略修改需要的域值。
[ signing_policy ]
organizationName = supplied
commonName = supplied

# 签发下级证书时，对下级证书约束。
# 注：自签名证书也使用此段段落。
[ v3_sub ]
# 基本约束。
#basicConstraints = critical,CA:true
basicConstraints = critical,CA:false
# CA证书用途。
#keyUsage = critical,keyCertSign,cRLSign,nonRepudiation
# 叶证书用途。
keyUsage = critical,digitalSignature,keyEncipherment
# 扩展密钥用途。
extendedKeyUsage = critical,serverAuth,clientAuth
# 吊销分发（自签名证书不能启用）。
#crlDistributionPoints=URI:http://${2}/crl.pem

# 向CA机构申请证书时使用。
# 注：自签名证书也使用此段段落。
[ req ]
prompt = no
default_md = sha256
distinguished_name = distinguished_name
req_extensions = req_ext

# 向CA机构申请证书时使用。
# 注：自签名证书也使用此段段落。
[ distinguished_name ]
# 组织名。
organizationName = ${2}
# 常用名(域名)。
commonName = ${2}

# 向CA机构申请证书时使用。
[ req_ext ]
# 主题替代名称(域名)。
#subjectAltName = critical,@alt_names

# 向CA机构申请证书时使用。
[ alt_names ]
DNS.1 = ${2}
DNS.2 = localhost
DNS.3 = localhost4
DNS.4 = localhost6
IP.1 = 127.0.0.1
IP.2 = ::1

EOF
}

#
CHK_OPENSSL=$(which openssl >> /dev/null 2>&1 ; echo $?)
if [ ! ${CHK_OPENSSL} -eq 0 ];then
{
	echo "openssl未安装。"
	exit 1
}
fi


function print_usage()
{
cat << EOF
Usage: 
	${SHELL_NAME} < 项目名称 >

	  创建自签名根证书或创建新证书请求。

	${SHELL_NAME} < CA项目名称 > < 项目请求文件 > < 项目证书文件 >
	  
	  签发下级证书。

	${SHELL_NAME} < CA项目名称 > revoke [ 证书编号 ]
	  
	  吊销下级证书。
EOF
}


# 项目名称。
CO_NAME=$1

#
if [ "${CO_NAME}" == "" ];then
{
	print_usage
	exit 22
}
fi

# 工作路径。
WORK_PATH="./${CO_NAME}"

# 创建需要的目录。
mkdir -p ${WORK_PATH}/{certs,crl,newcerts,conf.d,private}

# 配置文件。
CNF_FILE="${WORK_PATH}/ssl.conf"
# 请求文件。
CSR_FILE="${WORK_PATH}/pem.csr"
# 证书文件。
CRT_FILE="${WORK_PATH}/pem.crt"
# 私钥文件。
KEY_FILE="${WORK_PATH}/private/pem.key"
# 随机文件。
RAD_FILE="${WORK_PATH}/private/.rand"
# 吊销文件。
CRL_FILE="${WORK_PATH}/pem.crl"


if [ ! -f ${WORK_PATH}/conf.d/index.txt ];then
	touch ${WORK_PATH}/conf.d/index.txt
fi
	
if [ ! -f ${WORK_PATH}/conf.d/serial ];then
	echo '01' > ${WORK_PATH}/conf.d/serial
fi
	
if [ ! -f ${WORK_PATH}/conf.d/crlnumber ];then
	echo '01' > ${WORK_PATH}/conf.d/crlnumber
fi

if [ ! -f ${RAD_FILE} ];then
	openssl rand -out ${RAD_FILE} -hex 20
fi

# 检查配置文件。
if [ ! -f ${CNF_FILE} ];then
{
	# 创建默认的配置文件。
	make_default_conf ${CNF_FILE} ${CO_NAME}
	if [ -f ${CNF_FILE} ];then
		echo "项目的配置文件(${CNF_FILE})已经创建，请在编辑并确认后，重新执行：./${SHELL_NAME} ${CO_NAME}"
	else
		echo "创建配置文件错误。"
	fi

	exit 1
}
fi

# 检查私钥文件。
if [ ! -f ${KEY_FILE} ];then
{
	# 创建私钥文件。
	openssl genrsa -out ${KEY_FILE} 4096 -f4 >> /dev/null 2>&1
	if [ ! $? -eq 0 ];then
	{
		echo "创建私钥文件错误。"
		exit 1
	}
	fi
}
fi

# 检查证书文件。
if [ ! -f ${CRT_FILE} ];then
{
	#等待用户选择。
	echo -e "\n"
	read -n 1 -p "按 [s] 键创建自签名CA证书，按 [r] 键创建证书请求文件，其它键放弃并退出。 > " CHAR 
	echo -e "\n"

	#
	if [ "${CHAR}" == "s" ];then
	{
	    # 创建自签名CA证书。
		openssl req -new -x509 -config ${CNF_FILE}  -extensions v3_sub -key ${KEY_FILE} -out ${CRT_FILE} -days 3650 -batch
		# -extensions v3_sub
		if [ ! $? -eq 0 ];then
		{
			echo "创建自签名CA证书文件错误。"
			exit 1
		}
		fi
	}
	elif [ "${CHAR}" == "r" ];then
	{
	    # 创建请求文件。
		openssl req -new -config ${CNF_FILE} -key ${KEY_FILE} -out ${CSR_FILE} -batch
		# -reqexts v3_req
		if [ ! $? -eq 0 ];then
		{
			echo "创建请求文件错误。"
			exit 1
		}
		else
		{
			echo "证书的请求文件($(realpath ${CSR_FILE}))已经创建，签名后的证书文件请放置在：$(realpath ${CRT_FILE})"
		}
		fi
	}
	else
	{
		echo "放弃。"
		exit 1
	}
	fi
}
else
{
	if [ $# -lt 2 ];then
	{
		print_usage
		exit 22
	}
	fi

	if [ "$2" == "revoke" ];then
	{
		REVOKE_FILE="${WORK_PATH}/newcerts/$3.pem"
		if [ -f "${REVOKE_FILE}" ];then
		{
			
			openssl ca -revoke ${REVOKE_FILE}  -config ${CNF_FILE} -batch
			if [ ! $? -eq 0 ];then
			{
				echo "请求吊销的证书序列号不存在或其它错误。"
				exit 1
			}
			else
			{
				echo "'${REVOKE_FILE}' 已经吊销。"
			}
			fi
		}
		fi

		openssl ca -gencrl -config ${CNF_FILE} -out ${CRL_FILE} -batch
		if [ ! $? -eq 0 ];then
		{
			echo "吊销列表已经更新错误。"
			exit 1
		}
		else
		{
			echo "吊销列表已经更新：${CRL_FILE}"
		}
		fi
	}
	else 
	{
		if [ $# -lt 3 ];then
		{
			print_usage
			exit 22
		}
		fi

		SUB_CSR_FILE=$2
		SUB_CRT_FILE=$3
		# 签属子证书。
		openssl ca -config ${CNF_FILE} -extensions v3_sub -policy signing_policy  -in ${SUB_CSR_FILE} -out ${SUB_CRT_FILE}  -batch
		#-keyfile ${CA_KEY_FILE} -cert ${CA_CRT_FILE} -outdir ${CRT_PATH}/
    	if [ ! $? -eq 0 ];then
		{
			echo "创建证书文件错误。"
			exit 1
		}
    	fi
	}
	fi
}
fi

exit 0
