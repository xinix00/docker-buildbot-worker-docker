FROM        xinix00/buildbot-worker:0.9.9.post2
MAINTAINER  XiniX00

RUN apk add --no-cache docker \
    openrc && \

# config docker
    rc-update add docker boot