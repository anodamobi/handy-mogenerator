#!/bin/sh

# mogen.sh
#
# Created by Oksana Kovalchuk <oksana@anoda.mobi>
# Created by Alex Zavrazhniy <alex@anoda.mobi>
# Created on 5/17/14
# Copyright (c) 2014 ANODA. All rights reserved.

# OSX hack: add /usr/local/bin to the PATH env variable
export PATH="/usr/local/bin:$PATH"

# TODO: Change this to the name of custom ManagedObject base class (if applicable)
# If no custom MO class is required, remove the "--base-class $baseClass" parameter
# from mogenerator call baseClass=DOManagedObject

if [ -f ${INPUT_FILE_PATH}/.xccurrentversion ]
then
	file=`/usr/libexec/PlistBuddy "${INPUT_FILE_PATH}/.xccurrentversion" -c 'print _XCCurrentVersionName'`
	curVer="${INPUT_FILE_PATH}/$file"
else
	curVer=`find "${INPUT_FILE_PATH}" -name "*.xcdatamodel"`
fi

DB_NAME=$(echo \"${curVer}\" | awk -F/ '{ print $(NF-1) }' | awk -F. '{ print $1 }')

BASEPATH=$( cd "${curVer}/../../" && pwd ) 
TEMPLATEPATH=$(dirname $0)
(
	set -x
	mogenerator \
		--model "$curVer" \
		--machine-dir "${BASEPATH}/EntitiesMachine/" \
		--human-dir "${BASEPATH}/Entities/" \
		--includeh "${BASEPATH}/${DB_NAME}EntitiesHeader.h" \
		--v2 \
		--template-path "${TEMPLATEPATH}"
)

(
	set -x
	${DEVELOPER_BIN_DIR}/momc \
		-XD_MOMC_TARGET_VERSION=10.6 \
		"${INPUT_FILE_PATH}" \
		"${TARGET_BUILD_DIR}/${EXECUTABLE_FOLDER_PATH}/${INPUT_FILE_BASE}.momd"
)

echo "mogend.sh is done"
# EOF