FROM        xinix00/buildbot-worker:v0.9.9.post2
MAINTAINER  XiniX00

RUN apk add --no-cache docker && \
    apk add --no-cache openrc && \

# config docker
    rc-update add docker boot