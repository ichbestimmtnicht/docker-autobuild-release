# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Template created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Set global environment variables
ARG SRC_REPO
ARG SRC_TAG

# create the buildcontext
FROM scratch as buildcontext

COPY . .

# Setup arguments for next image
ARG SRC_REPO
ARG SRC_TAG

# Pull image
FROM ${SRC_REPO}:${SRC_TAG} as bundle

RUN apk update
