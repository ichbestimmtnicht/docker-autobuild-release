#!/bin/sh

# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Template created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Install req
# Attention: yum is not tested

install() {
    PKG_MANAGER_PATH=$( command -v yum || command -v apt-get || command -v apk ) || ( echo "Neither yum, apt-get nor apk found"; exit1 )
    PKG_MANAGER=$(basename $PKG_MANAGER_PATH)
    case $PKG_MANAGER in
        apt-get)
            $PKG_MANAGER update && $PKG_MANAGER install -y -q $SR_PACKAGES
            ;;
        apk)
            $PKG_MANAGER add --no-cache $SR_PACKAGES
            ;;
        yum)
            $PKG_MANAGER install -y $SR_PACKAGES
            ;;
    esac
}
