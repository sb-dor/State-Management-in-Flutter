# https://hub.docker.com/search?q=explore

# https://www.youtube.com/watch?v=ODcHcctHr2A&list=PLFWsxjZUD8jxt9bw8d36uPxm7cmRT8hTh&index=2

#FROM scratch
FROM ubuntu:latest
#FROM cirrusci/flutter:stable

ENV PATH="$PATH:/opt/flutter/bin"

RUN apt-get update -y && apt-get upgrade -y
# docker run -it my-ubuntu /bin/bash

RUN apt-get install -y git curl git
RUN git config --global http.postBuffer 524288000
RUN git config --global http.version HTTP/1.1
RUN mkdir -p /opt/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /opt/flutter

#COPY