# Templates to ease multiarch dockerimages

[![Docker Build Type](https://img.shields.io/docker/cloud/automated/ichbestimmtnicht/docker-autobuild.svg)](https://hub.docker.com/r/ichbestimmtnicht/docker-autobuild/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/ichbestimmtnicht/docker-autobuild.svg)](https://hub.docker.com/r/ichbestimmtnicht/docker-autobuild/)
[![Docker Stars](https://img.shields.io/docker/stars/ichbestimmtnicht/docker-autobuild.svg)](https://hub.docker.com/r/ichbestimmtnicht/docker-autobuild/)
[![Docker Pulls](https://img.shields.io/docker/pulls/ichbestimmtnicht/docker-autobuild.svg)](https://hub.docker.com/r/ichbestimmtnicht/docker-autobuild/)
[![GitHub issues](https://img.shields.io/github/issues/ichbestimmtnicht/docker-autobuild-release.svg?label="Githubissues")](https://github.com/ichbestimmtnicht/docker-autobuild-release/issues)
[![GitHub stars](https://img.shields.io/github/stars/ichbestimmtnicht/docker-autobuild-release.svg?style=social&label=Star)](https://github.com/ichbestimmtnicht/docker-autobuild-release/)

![License](https://i.creativecommons.org/l/by/4.0/88x31.png)

## NOTE: The alpine based images created from this repo itself are just for testing purposes

## Usage

- Change your console path into the root folder of your project

- Copy the necessary files \
    NOTES: You can switch from Option 1 to Option 2 for any hook individually at any time. \
    In case you wanna be safe and secure use Option 2 (Have a look why Option 0 is [not recommended](https://sysdig.com/blog/friends-dont-let-friends-curl-bash/)). \
    No already present file will get overwritten.

  - Option 0 - Quickstart (Technically a shorter Option 1 but piping from the internet directly to bash is [not recommended](https://sysdig.com/blog/friends-dont-let-friends-curl-bash/))

    ```bash
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/master/template/initialize.sh | bash
    ```

  - Option 1 - Hooks get downloaded from this repository @ buildtime.

    ```bash
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/master/template/initialize.sh > initialize.sh
    bash initialize.sh
    rm initialize.sh
    ```

  - Option 2 - Using the code locally

    ```bash
    curl -sSL https://raw.githubusercontent.com/ichbestimmtnicht/docker-autobuild-release/master/template/initialize.sh > initialize.sh
    bash initialize.sh -local
    rm initialize.sh
    ```

- use ```bash initialize.sh -tag=master``` to always get the bleeding edge version downloaded at buildtime. Use with caution: BREAKING CHANGES MAY HAPPEN!

- ```hooks/env.sh``` is where your variables are set. Change the file to your liking (It is well documented) \
Please do not forget to set ssh-keys and similiar values only within your dockerhub env and only reference them like ```BUILD_ARG_SSH_KEY="${SSH_KEY}"``` within the ```hooks/env.sh``` file!

- Have a look at the different Dockerfile templates (within the hooks folder) and copy/paste/adapt the content of your Dockerfile into them. \
PLANNED Or you could use a [combined Dockerfile](https://gitlab.com/ros2cuisine/templates/docker-autobuild/wiki/Combined.md)

- If you already had a dockerfile in your project root, it wasn’t overwritten. This is the file that will be displayed at the hub.docker.com website. \
[Example from this repo](https://hub.docker.com/r/ichbestimmtnicht/docker-autobuild/dockerfile) \
I recommend to add a header like this in case you don't use a combined Dockerfile:

    ```dockerfile
    # Dummy Dockerfile because hooks aren't working with a custom Filename
    # Have a look into the hooks folder to see them per arch
    # https://github.com/ichbestimmtnicht/docker-autobuild-release/tree/master/hooks/

    FROM scratch as buildcontext

    COPY . .

    # Your instructions
    FROM alpine
    ```

- Setup [Dockerhub autobuild](https://docs.docker.com/docker-hub/builds/)

- Let the images build and test them

## Known Limitations

- None-amd64 images are not properly tagged -> only within the manifest

- No Experimental Features (like ```--platform``` to tag those none amd64 images correct from the start)

- if the build process for an arch doesn't finish the last working build will get referenced (See To do point 3)

## To do

- coding the option to use a single dockerfile for all arches
- adding moore arches
- adding option to let the build fail if one of the images is not building correctly (the base tag will get updated and references to the last working image in this case)
- enable experimental docker build features for hub.docker.com
- CI/CD integrations: jenkins; circleci; gitlab
- Test the ability to build windows containers
- Combine filedownloads in ```hooks/initialize.sh``` into a single loop with the help of an array

## Contribution

Create an issue with your suggestions \
Active development is in a private gitlab repository so do not open Pull Requests to this repository itself. Contact me (e.g. with an issue) to get access.

## License

![License](https://i.creativecommons.org/l/by/4.0/88x31.png) \
[docker-autobuild](https://github.com/ichbestimmtnicht/docker-autobuild-release) by [Ludwig Werner Döhnert](https://github.com/ichbestimmtnicht/) is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/). \
Based on a work at [https://gitlab.com/ichbestimmtnicht/docker-autobuild](https://gitlab.com/ichbestimmtnicht/docker-autobuild)
