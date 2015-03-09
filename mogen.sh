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

HUMAN_DIR="${INPUT_FILE_DIR}/Entities"
MACHINE_DIR="${INPUT_FILE_DIR}/EntitiesMachine"
INCLUDE_H="${INPUT_FILE_DIR}/ModelIncludes.h"
TEMPLATEPATH=$(dirname $0)

(
	set -x # for debugging
	mogenerator \
		--model "${INPUT_FILE_PATH}" \
		--machine-dir "$MACHINE_DIR/" \
		--human-dir "$HUMAN_DIR/" \
		--includeh "$INCLUDE_H" \
		--v2 \
		--template-path "${TEMPLATEPATH}"
)

(
	set -x # for debugging
	${DEVELOPER_BIN_DIR}/momc \
		-XD_MOMC_TARGET_VERSION=10.6 \
		"${INPUT_FILE_PATH}" \
		"${TARGET_BUILD_DIR}/${EXECUTABLE_FOLDER_PATH}/${INPUT_FILE_BASE}.mom"
)

echo "mogen.sh is done"
# EOF