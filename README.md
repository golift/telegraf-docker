# telegraf-docker

## Why

Provides a telegraf docker image with added tools for monitoring disks, sensors and IPMI.
This exists because the base telegraf Docker image makes it difficult to monitor some system metrics.
See [this issue](https://github.com/influxdata/influxdata-docker/issues/563) for more info about those difficulties.

## What

Re-creates the official [Telegraf docker container](https://hub.docker.com/_/telegraf) with the following tools added:
- `smartctl` (smartmontools)
- `ipmitool`
- `nvme-cli`
- `sensors` (lm-sensors)
- `mtr` (mtr-tiny)
- `sudo`

**In addition to sudo being installed,
[sudoers entries](https://github.com/golift/telegraf-docker/blob/main/Dockerfile#L6-L8)
are added for `smartctl`, `ipmitool` and `nvme`.**

## How

Built automatically by DockerHub Cloud.
[Use the following repository](https://hub.docker.com/repository/registry.docker.io/golift/telegraf/tags).

```
docker pull golift/telegraf
```

**This is a [Docker-Sponsored Open Source Project](https://docs.docker.com/docker-hub/repos/manage/trusted-content/dsos-program/),**
**so it has no pull limits.**

## When

The renovate automatically merges pull request with a new Telegraf Docker manifest when a new Telegraf version is released.
This auto-merge to the `main` branch triggers Docker Cloud to re-build this image.

This should always be up to date with the `latest` tag of `telegraf` on Docker Hub.
The built manifest supports the same 3 architectures as the original ubuntu image, and 2 for alpine.

## Where

- Home: [https://golift.io](https://golift.io)
- GitHub: [https://github.com/golift/telegraf-docker](https://github.com/golift/telegraf-docker)
- Docker: [https://hub.docker.com/r/golift/telegraf](https://hub.docker.com/r/golift/telegraf/)
- Discord: [https://golift.io/discord](https://golift.io/discord)

## Problems

It's always the `latest` tag. This makes pinning a version difficult. One day [renovate will support adding repo tags](https://github.com/renovatebot/renovate/issues/2928), which will allow Docker to build different manifest tags. If you want to pin a specific version, you should use the sha256 [shown on docker hub](https://hub.docker.com/repository/registry.docker.io/golift/telegraf/tags).
