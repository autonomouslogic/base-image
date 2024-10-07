FROM ghcr.io/containerbase/base:11.11.29

LABEL name="sbase-image" \
  maintainer="Kenneth Jørgensen <kenneth@autonomouslogic.com>" \
  org.opencontainers.image.title="Base Docker Image" \
  org.opencontainers.image.description="Base Docker Image." \
  org.opencontainers.image.source="https://github.com/autonomouslogic/base-image" \
  org.opencontainers.image.licenses="MIT-0"

WORKDIR /usr/src/build

# renovate: datasource=github-tags lookupName=git/git
RUN install-tool git v2.46.2

# renovate: datasource=docker versioning=docker
RUN install-tool node 20.18.0

# renovate: datasource=npm
RUN install-tool yarn 1.22.22

# renovate: datasource=docker versioning=docker
RUN install-tool docker 27.3.1
COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx
RUN docker buildx install

# renovate: datasource=adoptium-java
RUN install-tool java 21.0.4+7.0.LTS

# renovate: datasource=gradle-version versioning=gradle
RUN install-tool gradle 8.10.2

# renovate: datasource=maven lookupName=org.apache.maven:maven
RUN install-tool maven 3.9.9

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

RUN apt-get update && \
    apt-get install -y \
        gh \
        jq \
        build-essential \
    && apt-get clean autoclean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
RUN git config --global --add safe.directory /usr/src/app
