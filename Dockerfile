FROM        xinix00/buildbot-worker:0.9.9.post2
MAINTAINER  XiniX00

ENV PATH=/opt/google-cloud-sdk/bin:$PATH

WORKDIR /opt/
RUN apk add --no-cache docker \
    jq \
    unzip \
    ca-certificates && \

# Add google cloud tools
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && \
    unzip google-cloud-sdk.zip && \
    rm google-cloud-sdk.zip && \

    # install it
    google-cloud-sdk/install.sh \
        --usage-reporting=true \
        --path-update=true \
        --bash-completion=true \
        --rc-path=/.bashrc \
        --additional-components kubectl && \

    # Disable updater check for the whole installation.
    google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true && \
    sed -i -- 's/\"disable_updater\": false/\"disable_updater\": true/g' google-cloud-sdk/lib/googlecloudsdk/core/config.json
    

WORKDIR /buildbot
CMD ["dumb-init", "twistd", "-ny", "buildbot.tac", "&", "dockerd"]
