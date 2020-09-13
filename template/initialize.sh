#!/bin/sh

# This script will get the necessary files to get your project ready to go for multiarch docker autobuilds
# There are no child scripts that will be executed

# https://github.com/ichbestimmtnicht/docker-autobuild-release
# Created 2020 by Ludwig Werner Döhnert
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.

# Local variables used when no commandline arguments are present
INITIALIZE_TAG="false"
LOCAL_INSTALL="true"
INIT_GITLAB="false"

# Interpret commandline arguments
for commandline_argument in "$@"
do
    if [ ${commandline_argument} = "-remote" ]; then
        LOCAL_INSTALL="false"
    elif [ $(echo "${commandline_argument}" | cut -c -5) = "-tag=" ]; then
        INITIALIZE_TAG=${commandline_argument:5}
    elif [ ${commandline_argument} = "-gitlab" ]; then
        INIT_GITLAB="true"
    else
        echo "ERROR: Commandline argument \"${commandline_argument}\" unknown. Aborting."
        exit 1
    fi
done

# Get the latest tag from the repo if not already set
if [ ${INITIALIZE_TAG} = "false" ]; then
    INITIALIZE_TAG=$(curl -s https://api.github.com/repos/ichbestimmtnicht/docker-autobuild-release/tags \
        | grep 'name.*v[0-9]' \
        | head -n 1 \
        | cut -d '"' -f 4)
fi
echo "INFO: using tag: ${INITIALIZE_TAG}"

# Decide from which folder the scripts need to be downloaded
if [ ${LOCAL_INSTALL} = "true" ]; then
    echo "INFO: downloading scripts from the hooks folder (Local installation)"
    DOWNLOAD_FOLDER="hooks"
else
    echo "INFO: downloading scripts from the template folder"
    DOWNLOAD_FOLDER="template"
fi

# Gitlab init
if [ ${INIT_GITLAB} = "false" ]; then
    echo "INFO: Gitlab trigger not present -> skipping download"
else
    echo "INFO: Initializing Gitlab-ci scripts and templates"

    echo "INFO: Starting creating .gitlab folder"
    mkdir -p .gitlab

    if test -f ".gitlab-ci.yml"; then
        curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/gitlab/.gitlab-ci.yml > .gitlab-ci.yml
    else
        echo "INFO: .gitlab-ci.yml already present -> skipping download"
    fi

    if test -f ".gitlab/Build.gitlab-ci.yml"; then
        curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/gitlab/Build.gitlab-ci.yml > .gitlab/Build.gitlab-ci.yml
    else
        echo "INFO: .gitlab/Build.gitlab-ci.yml already present -> skipping download"
    fi

    if test -f ".gitlab/Deploy.gitlab-ci.yml"; then
        curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/gitlab/Deploy.gitlab-ci.yml > .gitlab/Deploy.gitlab-ci.yml
    else
        echo "INFO: .gitlab/Deploy.gitlab-ci.yml already present -> skipping download"
    fi

    if test -f ".gitlab/Test.gitlab-ci.yml"; then
        curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/gitlab/Test.gitlab-ci.yml > .gitlab/Test.gitlab-ci.yml
    else
        echo "INFO: .gitlab/Test.gitlab-ci.yml already present -> skipping download"
    fi

    if test -f ".gitlab/Trigger.gitlab-ci.yml"; then
        curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/gitlab/Trigger.gitlab-ci.yml > .gitlab/Trigger.gitlab-ci.yml
    else
        echo "INFO: .gitlab/Trigger.gitlab-ci.yml already present -> skipping download"
    fi
fi

echo "INFO: Starting creating hooks folder"
mkdir -p hooks

# Download scripts
echo "INFO: Initializing scripts and templates into hooks folder"
if test -f "hooks/build"; then
    echo "INFO: File hooks/build already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/${DOWNLOAD_FOLDER}/build > hooks/build
    echo "INFO: hooks/build downloaded"
fi

if test -f "hooks/post_checkout"; then
    echo "INFO: File hooks/post_checkout already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/${DOWNLOAD_FOLDER}/post_checkout > hooks/post_checkout
    echo "INFO: hooks/post_checkout downloaded"
fi

if test -f "hooks/pre_build"; then
    echo "INFO: File hooks/pre_build already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/${DOWNLOAD_FOLDER}/pre_build > hooks/pre_build
    echo "INFO: hooks/pre_build downloaded"
fi

if test -f "hooks/push"; then
    echo "INFO: File hooks/push already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/${DOWNLOAD_FOLDER}/push > hooks/push
    echo "INFO: hooks/push downloaded"
fi

# Download template files
if test -f "hooks/env.sh"; then
    echo "INFO: File hooks/env.sh already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/env.sh > hooks/env.sh
    echo "INFO: hooks/env.sh downloaded"
fi

if test -f "hooks/amd64.Dockerfile"; then
    echo "INFO: File hooks/amd64.Dockerfile already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/amd64.Dockerfile > hooks/amd64.Dockerfile
    echo "INFO: hooks/amd64.Dockerfile downloaded"
fi

if test -f "hooks/arm32v7.Dockerfile"; then
    echo "INFO: File hooks/arm32v7.Dockerfile already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/arm32v7.Dockerfile > hooks/arm32v7.Dockerfile
    echo "INFO: hooks/arm32v7.Dockerfile downloaded"
fi

if test -f "hooks/arm64v8.Dockerfile"; then
    echo "INFO: File hooks/arm64v8.Dockerfile already present -> skipping download"
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/arm64v8.Dockerfile > hooks/arm64v8.Dockerfile
    echo "INFO: hooks/arm64v8.Dockerfile downloaded"
fi

if test -f "Dockerfile"; then
    echo "INFO: Dockerfile already present in project root -> skipping download"
    echo "      It is recommended that you add the information that this file does not represent the used Dockerfile for your automatic docker builds"
    echo "      Example Dockerfile header:"
    echo ""
    echo "# Dummy Dockerfile because hooks aren't working with a custom Filename"
    echo "# Have a look into the hooks folder to see them per arch"
    echo "# https://github.com/ichbestimmtnicht/docker-autobuild-release/tree/master/hooks/"
    echo ""
else
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/${INITIALIZE_TAG}/template/Dockerfile > Dockerfile
    echo "INFO: template Dockerfile to be presented at hub.docker.com downloaded into project root"
fi

echo "INFO: docker-autobuild-release init successfull"
echo "      Don't forget to modify the hooks/env.sh and Dockerfiles"

exit 0
