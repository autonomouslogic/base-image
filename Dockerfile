FROM ghcr.io/containerbase/base:14.14.4

LABEL name="base-image" \
  maintainer="Kenneth Jørgensen <kenneth@autonomouslogic.com>" \
  org.opencontainers.image.title="Base Docker Image" \
  org.opencontainers.image.description="Base Docker Image." \
  org.opencontainers.image.source="https://github.com/autonomouslogic/base-image" \
  org.opencontainers.image.licenses="MIT-0"

WORKDIR /usr/src/build

# renovate: datasource=github-tags lookupName=git/git
RUN install-tool git v2.55.0

# renovate: datasource=docker versioning=docker
RUN install-tool node 24.20.0

# renovate: datasource=npm
RUN install-tool yarn 1.22.22

# renovate: datasource=docker versioning=docker
RUN install-tool docker 29.8.0
COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx
RUN docker buildx install

# renovate: datasource=adoptium-java
RUN install-tool java 25.0.4+101.0.LTS

# renovate: datasource=gradle-version versioning=gradle
RUN install-tool gradle 9.7.1

# renovate: datasource=maven lookupName=org.apache.maven:maven
RUN install-tool maven 3.9.16

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

RUN apt-get update && \
    apt-get install -y \
        gh \
        jq \
        build-essential \
        wget \
    && apt-get clean autoclean && rm -rf /var/lib/apt/lists/*

# renovate: datasource=github-releases depName=rust-lang/rust
ARG RUST_VERSION=1.98.1
ENV CARGO_HOME=/usr/local/cargo
ENV RUSTUP_HOME=/usr/local/rustup
ENV PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- \
    --default-toolchain ${RUST_VERSION} \
    --profile minimal \
    --no-modify-path \
    -y
RUN rustup component add rustfmt && \
    cargo install sleek && \
    cp /usr/local/cargo/bin/rustfmt \
       /usr/local/cargo/bin/cargo-fmt \
       /usr/local/cargo/bin/sleek \
       /usr/local/bin/

# renovate: datasource=docker lookupName=hashicorp/terraform versioning=docker
RUN install-tool terraform 1.16.1

WORKDIR /usr/src/app
RUN git config --global --add safe.directory /usr/src/app
