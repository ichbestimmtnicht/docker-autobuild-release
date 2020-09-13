#!/bin/sh

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

# use any build args at all?
BUILD_ARGS=true

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
