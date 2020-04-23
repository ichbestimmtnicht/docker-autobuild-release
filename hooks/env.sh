# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Template created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Preset global variables from hub.docker.com
# SOURCE_BRANCH: the name of the branch or the tag that is currently being tested.
# SOURCE_COMMIT: the SHA1 hash of the commit being tested.
# COMMIT_MSG: the message from the commit being tested and built.
# DOCKER_REPO: "test" the name of the Docker repository being built.
# DOCKERFILE_PATH: the dockerfile currently being built.
# DOCKER_TAG: the Docker repository tag being built.
# IMAGE_NAME: the name and tag of the Docker repository being built. (This variable is a combination of DOCKER_REPO:DOCKER_TAG.)

# Hardcoded Variables that are pointless to change
# LABEL_BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
# LABEL_VCS_REF="$(git rev-parse --short HEAD)"

# Multi entry variables
# LABEL_ only: Use a double underscore __ for an hyphen -
# LABEL_
LABEL_DESCRIPTION="Testing https://github.com/ichbestimmtnicht/docker-autobuild-release"
# You find 6 moore standard labels like maintainer and vendor within the optional section

# BUILD_ARG_
BUILD_ARGS=true
BUILD_ARG_SRC_REPO="alpine"
BUILD_ARG_SRC_TAG="latest"

BUILD_HOSTS=false
# BUILD_HOST_

BUILD_CGROUPS=false
# BUILD_CGROUP_

# Optional variables with their defaults
# be aware to order them correctly in case you copy them to the top
# DO NOT DELETE THEM
DEST_ARCHES="amd64 arm32v7 arm64v8"
BUILD_COMPRESS=true
BUILD_ISOLATION=false
BUILD_FORCE_RM=true
BUILD_NO_CACHE=false
BUILD_PULL=true
BUILD_QUIET=false
BUILD_TARGET_STAGE=false

# Planned sed for the next 3 from DOCKER_REPO e.g. index.docker.io/ichbestimmtnicht/docker-autobuild
DEST_HUB="index.docker.io"
DEST_USER="ichbestimmtnicht" 
DEST_REPO="docker-autobuild"
DEST_TAG="${DOCKER_TAG}"

LABEL_DOCKER_CMD="docker pull ${IMAGE_NAME}"
LABEL_MAINTAINER="${DEST_USER}"
LABEL_NAME="${IMAGE_NAME}"
LABEL_VCS_URL="https://github.com/ichbestimmtnicht/docker-autobuild-release/"
LABEL_VENDOR="${DEST_USER}"
LABEL_SCHEMA_VERSION="1.0.0-rc1"

#--------------------------------------------------------------
# Experimental Features
# DO NOT DELETE
# OR CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING
# If you are running your own docker build server 
# and have experimental features enabled
# you could use squash. (combine layers)
# But make sure you do NOT download the scripts at buildtime
# from the master branch.
# NOT TESTED
BUILD_SQUASH=false

#--------------------------------------------------------------
# Placeholder for upcoming features
# DO NOT CHANGE OR DELETE

# self-explanatory - feature will be added in the near future
BUILD_SINGLE_DOCKERFILE=false

# We may add support for different host build arches
# that you could use your raspberry pi or something like that as your buildserver
BUILD_ARCH="amd64"

# we may support MS-Windows Container in the future
DEST_OS="linux"
# for windows builds
# possible values=default process or hyperv
BUILD_ISOLATION=false

# current implementation doesn't make sense
# DO NOT CHANGE
# NOT TESTED
BUILD_PLATFORM=false
