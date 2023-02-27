#!/bin/bash

set -euxo pipefail

OUTPUT_DIR="${OUTPUT_DIR:-}"
VERSION="${VERSION:-}"

if [ $# -eq 0 ]; then
    if [ -z "$OUTPUT_DIR" ]; then
        echo "OUTPUT_DIR env var not set!" >&2
        exit 1
    fi

    if [ -z "$VERSION" ]; then
        echo "VERSION env var not set!" >&2
        exit 1
    fi

    buildargs="--output /work/build/stage ${VERSION#v}"
    /project/internal/buildscripts/packaging/msi/msi-builder/build.sh $buildargs
    mkdir -p $OUTPUT_DIR
    echo "Copying MSI to $OUTPUT_DIR"
    cp /work/build/stage/*.msi $OUTPUT_DIR/
else
    exec "$@"
fi
