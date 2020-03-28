# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Template created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Set global environment variables

FROM scratch AS buildcontext

COPY . .

# Setup Qemu
FROM alpine AS qemu

ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-aarch64.tar.gz

RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

# Setup arguments for the bundle image
ARG SRC_HUB
ARG SRC_NAME
ARG SRC_REPO
ARG SRC_TAG

# Pull image
FROM ${SRC_HUB}/${SRC_NAME}/${SRC_REPO}:${SRC_TAG} AS bundle

COPY --from=qemu qemu-aarch64-static /usr/bin

RUN apk install --no-cache \
    zsh

#WORKDIR /root

#ENTRYPOINT ["/bin/sh"]

#CMD ["/bin/sh"]

#ONBUILD
