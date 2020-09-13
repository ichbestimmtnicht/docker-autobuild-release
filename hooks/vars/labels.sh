#!/bin/sh

# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Template created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Hardcoded labels that are pointless to change
# BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
# VCS_REF="$(git rev-parse --short HEAD)"

DOCKER_CMD="docker pull ${IMAGE_NAME}"
MAINTAINER="${DEST_USER}"
NAME="${IMAGE_NAME}"
VCS_URL="https://github.com/ichbestimmtnicht/docker-autobuild-release/"
VENDOR="${DEST_USER}"
SCHEMA_VERSION="1.0.0-rc1"
