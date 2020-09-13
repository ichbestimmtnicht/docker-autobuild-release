#!/bin/sh

# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Template created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# different destinations to push to

# Planned sed for the next 3 from DOCKER_REPO e.g. index.docker.io/ichbestimmtnicht/docker-autobuild
# DEST_HUB="index.docker.io" moved into hub.docker.com ENV VARS
DEST_USER="ichbestimmtnicht"
DEST_REPO="docker-autobuild"
DEST_TAG="${DOCKER_TAG}"