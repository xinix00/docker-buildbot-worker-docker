FROM        xinix00/buildbot-worker:0.9.9.post2
MAINTAINER  XiniX00

# set user to root, to add APKs
USER root
RUN apk add --no-cache docker

USER buildbot
