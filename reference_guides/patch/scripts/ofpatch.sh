#!/bin/ksh
#set -x

#SET VARIABLE and PATH
LIB_EXT=so
#LIB_BITS=`file $OPENFRAME_HOME/bin/basever | awk  '{print $3}' | awk -F- '{print $1}' | cut -c 1-2`
LIB_BITS=`$OPENFRAME_HOME/bin/ofversion | grep Base | awk '{print $NF}' | cut -c 1-2`
APP_PATH=$OPENFRAME_HOME/core/appbin
LIB_PATH=$OPENFRAME_HOME/lib
BIN_PATH=$OPENFRAME_HOME/bin
UTIL_PATH=$OPENFRAME_HOME/util

echodo()
{
 echo "$*"
 return
 eval "$*"
}

_verify_env()
{
	which offile > /dev/null 2>&1
	if [ $? == 1 ];then
		echo "$0 needs offile tool of OpenFrame Base"
		exit 1
	fi
	if [ ! $OPENFRAME_HOME ];then
		echo "\$OPENFRAME_HOME is not set"
		exit 1
	fi
	if [ ! $IPT_FILE ] || [ ! -f $IPT_FILE ] ;then
		echo "input file( $IPT_FILE ) is not a file or not exist"
		exit 1
	fi
	return 0
}

_usage(){
	echo "OpenFrame Patch Script"
	echo "Usage: $0 [options] <PatchFile>"
	echo "Options:"
	echo "  -h              Display this information"
	echo "  -i              Interactive"
	echo "  -t <L|U|B|S>	type of file"
	echo "              	L : Library"
	echo "              	U : Utility"
	echo "              	B : Binary"
	echo "              	S : Server"
	echo "  -n <IMS number>"
	echo "Example:"
	echo "       $0 -n 91530 dsview"
	exit
}

_resolve_type(){
	#if [[ $FILE_NAME = *\.$LIB_EXT\.* ]];then
	if [[ $FILE_NAME = *\.$LIB_EXT ]] || [[ $FILE_NAME = *\.$LIB_EXT\.* ]];then
		FILE_TYPE=L
		return
	fi
	ldd $IPT_FILE | egrep "libsvr.so|libsvrucs.so|libtmaxgw.so" > /dev/null 2>&1
	if [ $? = 0 ];then
		FILE_TYPE=S
		return
	fi
	if [[ $FILE_NAME = [A-Z]* ]];then
		FILE_TYPE=U
		return
	fi
	FILE_TYPE=B
		return

}

_set_path(){
	unset EXT_STR BITS_STR
	case $FILE_TYPE in
		L)TAR_PATH=$LIB_PATH;EXT_STR=".${LIB_EXT}";BITS_STR=".${LIB_BITS}";;
		U)TAR_PATH=$UTIL_PATH;;
		B)TAR_PATH=$BIN_PATH;;
		S)TAR_PATH=$APP_PATH;;
		*)echo "file type $FILE_TYPE is not defined";exit;;
	esac
}

_get_serial(){
if [ ! -f ${TAR_PATH}/${BASE_NAME}${EXT_STR}${BITS_STR}.${M_VERSION}.${IMS_NUMBER} ];then
	return
fi 
CNT=2
while true
do
	SER="_${CNT}"
	if [ ! -f ${TAR_PATH}/${BASE_NAME}${EXT_STR}${BITS_STR}.${M_VERSION}.${IMS_NUMBER}$SER ];then
		break
	fi 
	(( CNT += 1 ))
done
}

_report(){
	echo "###############################################################################"
	echo "# REPORT                                                                      #"
	echo "###############################################################################"
	echo "# INPUT FILE          : "$IPT_FILE                                              
	echo "# FILE TYPE           : "$FILE_TYPE                                             
	echo "# TARGET_PATH         : "$TAR_PATH                                              
	echo "# VERSION             : "$M_VERSION                                             
	echo "# IMS#                : "$IMS_NUMBER                                            
	echo "###############################################################################"
	echo -e "${M_PRODUCT}\t${IPT_FILE}\t${M_VERSION}\t${IMS_NUMBER}\t$(date '+%m/%d')"


}

################################################################################
# MAIN 
################################################################################
#IMS_NUMBER=00000
IMS_NUMBER=$(pwd | awk -F/ '{print $NF}')

while getopts :hit:n: options
do
case $options in
	h) _usage;;
	t) echo FILE_TYPE=$OPTARG;;	
	:) echo "-t needs file type";;
	i) echo "interactive opt enabled"
		INR_OPT=" -i ";;
	n) IMS_NUMBER=$OPTARG;;
	:) echo "-n needs ims number";;
	\?)  print "invalid " $OPTARG 1>&2
	_usage;;
esac
done

if ((  $# != $OPTIND ));then
	_usage
fi

#shift $OPTIND-1
shift $((OPTIND-1))
if [ ! $# = "1" ] || [ ! $IMS_NUMBER ];then
	_usage
fi

IPT_FILE=$1

_verify_env

#------------------------------------------------------------------------------#
# PREPARATION
#------------------------------------------------------------------------------#
FILE_NAME=${IPT_FILE##*/}
BASE_NAME=${FILE_NAME%%.*}

M_PRODUCT=`offile $IPT_FILE | awk '{print $4}' | awk -F/ '{print $NF}'`
#M_VERSION=`offile $IPT_FILE | awk 'NF>6{print $3}' | sed 's/,//g'|  sed 's/)//g' | tr ".(" "_"`
M_VERSION=`offile $IPT_FILE | awk '{print $3}' | sed 's/,//g'|  sed 's/)//g' | tr ".(" "_"`
M_VERSION=${M_VERSION:-0_0_0_0}

offile $FILE_NAME

if [ ! $FILE_TYPE ];then
	_resolve_type
fi
_set_path
_get_serial 

#------------------------------------------------------------------------------#
# MAKE COMMAND
#------------------------------------------------------------------------------#

echodo cp $INR_OPT $IPT_FILE  ${TAR_PATH}/${BASE_NAME}${EXT_STR}${BITS_STR}.${M_VERSION}.${IMS_NUMBER}$SER
cp $INR_OPT $IPT_FILE  ${TAR_PATH}/${BASE_NAME}${EXT_STR}${BITS_STR}.${M_VERSION}.${IMS_NUMBER}$SER
if [ -L ${TAR_PATH}/${BASE_NAME}${EXT_STR} ];then
	echodo unlink ${TAR_PATH}/${BASE_NAME}${EXT_STR}
	unlink ${TAR_PATH}/${BASE_NAME}${EXT_STR}
fi
if [ -e ${TAR_PATH}/${BASE_NAME}${EXT_STR} ];then
	echodo cp ${TAR_PATH}/${BASE_NAME}${EXT_STR} ${TAR_PATH}/${BASE_NAME}${EXT_STR}.org.`date '+%Y%m%d'`
	cp ${TAR_PATH}/${BASE_NAME}${EXT_STR} ${TAR_PATH}/${BASE_NAME}${EXT_STR}.org.`date '+%Y%m%d'`
fi
cd ${TAR_PATH}
echodo ln -s ${BASE_NAME}${EXT_STR}${BITS_STR}.${M_VERSION}.${IMS_NUMBER}$SER  ${BASE_NAME}${EXT_STR}
ln -sf ${BASE_NAME}${EXT_STR}${BITS_STR}.${M_VERSION}.${IMS_NUMBER}$SER  ${BASE_NAME}${EXT_STR}
echodo mv ${BASE_NAME}${EXT_STR} ${TAR_PATH}
mv ${BASE_NAME}${EXT_STR} ${TAR_PATH}

_report

