# Base Docker Image
Basic Docker image useful for builds and such.

View on [Docker Hub](https://hub.docker.com/r/autonomouslogic/base-image).

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/autonomouslogic/base-image)](https://github.com/autonomouslogic/base-image/releases)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/autonomouslogic/base-image/build.yml?branch=main)](https://github.com/autonomouslogic/base-image/actions)
[![GitHub](https://img.shields.io/github/license/autonomouslogic/base-image)](https://spdx.org/licenses/MIT-0.html)

The image contains:
* Based on [Containerbase](https://github.com/containerbase/base), which is based on Ubuntu
* Git
* Docker
* Node
  * NPM
  * Yarn
* Java
  * Gradle
  * Maven
* Rust
  * [rustfmt](https://github.com/rust-lang/rustfmt)
  * [sleek](https://crates.io/crates/sleek)
* Terraform
* _Additional tools_
  * [`jq`](https://stedolan.github.io/jq/)
  * [GitHub CLI `gh`](https://cli.github.com/)
  * Build essentials, like `gcc` and  `make`
  * curl
  * wget

## Versioning
This Docker image follows [semantic versioning](https://semver.org/) and [Conventional Commits](https://www.conventionalcommits.org/en/).

## Updates
This repo is automatically updated with the latest available versions of the above tools.

## License
This Docker image is licensed under the [MIT-0 license](https://spdx.org/licenses/MIT-0.html),
although it depends on or includes software under different licenses.
