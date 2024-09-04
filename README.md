# Base Docker Image
Basic Docker image useful for builds and such.

View on [Docker Hub](https://hub.docker.com/r/autonomouslogic/base-image).

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/autonomouslogic/base-image)](https://github.com/autonomouslogic/semantic-release-docker/releases)
[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/autonomouslogic/base-image/Build/main)](https://github.com/autonomouslogic/semantic-release-docker/actions)
[![GitHub](https://img.shields.io/github/license/autonomouslogic/base-image)](https://spdx.org/licenses/MIT-0.html)

The image contains:
* Based on [Containerbase](https://github.com/containerbase/base), which is based on Ubuntu
* Git
* Docker
* Node (NPM and Yarn)
* Java (Gradle and Maven)
* _Tools_
  * [`jq`](https://stedolan.github.io/jq/)
  * [GitHub CLI `gh`](https://cli.github.com/)
  * Build essentials, like `make`

## Versioning
This Docker image follows [semantic versioning](https://semver.org/) and [Conventional Commits](https://www.conventionalcommits.org/en/).

## License
This Docker image is licensed under the [MIT-0 license](https://spdx.org/licenses/MIT-0.html),
although it depends on or includes software under different licenses.
