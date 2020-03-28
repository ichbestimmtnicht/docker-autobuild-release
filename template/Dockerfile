# Created 2020 from Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Dummy Dockerfile because hooks aren't working with a custom Filename
# This file will be displayed on your https://hub.docker.com site
# Have a look into the hooks folder to see them per arch
# https://gitlab.com/ros2cuisine/templates/docker-autobuild/tree/master/hooks/

FROM scratch AS buildcontext

COPY . .

# Setup arguments for next image
ARG SRC_HUB
ARG SRC_NAME
ARG SRC_REPO
ARG SRC_TAG

# Pull image
FROM ${SRC_HUB}/${SRC_NAME}/${SRC_REPO}:${SRC_TAG} AS final

RUN your instructions
