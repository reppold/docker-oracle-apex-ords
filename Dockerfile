FROM ubuntu:14.04

MAINTAINER Andrzej Raczkowski <araczkowski@gmail.com>

ARG PASSWORD
ENV PASSWORD ${PASSWORD:-secret}

# get rid of the message: "debconf: unable to initialize frontend: Dialog"
ENV DEBIAN_FRONTEND noninteractive

EXPOSE 22 1521 8080 8888

# all installation files
COPY scripts /scripts

# ! for test the build process only !
# ! to reduce the image size !
# ! downoad the files is a part of the installation !
COPY files /files

# start the installation
RUN /scripts/install_main.sh


# ENTRYPOINT
ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
#CMD [""]
