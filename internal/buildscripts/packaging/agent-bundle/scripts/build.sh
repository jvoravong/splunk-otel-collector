#!/bin/bash

# Copyright Splunk Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -exuo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$( cd "$SCRIPT_DIR/../../../../../" && pwd )"
OUTPUT_DIR="${REPO_DIR}/dist"

ARCH="${1:-amd64}"
DOCKER_REPO="${2:-docker.io}"
IMAGE_NAME="agent-bundle"
OUTPUT="${IMAGE_NAME}-${ARCH}.tar.gz"
output_tar=$(basename "$OUTPUT" .gz)

docker buildx build \
    --platform linux/${ARCH} \
    -o type=image,name=${IMAGE_NAME}:${ARCH},push=false \
    -f ${SCRIPT_DIR}/../Dockerfile \
    --build-arg ARCH=${ARCH} \
    --build-arg DOCKER_REPO=${DOCKER_REPO} \
    ${SCRIPT_DIR}/..

cid=$(docker create --platform linux/${ARCH} ${IMAGE_NAME}:${ARCH} true)

tmpdir=$(mktemp -d)
mkdir ${tmpdir}/${IMAGE_NAME}

trap "docker rm -f $cid; rm -rf $tmpdir; rm -f $output_tar" EXIT

docker export $cid | tar -C ${tmpdir}/${IMAGE_NAME} -xf -
rm -rf ${tmpdir}/${IMAGE_NAME}/{proc,sys,dev,etc} ${tmpdir}/${IMAGE_NAME}/.dockerenv
mkdir -p "$OUTPUT_DIR"
(cd $tmpdir && tar -zcf ${OUTPUT_DIR}/${OUTPUT} *)
