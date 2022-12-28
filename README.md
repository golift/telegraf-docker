# telegraf-docker

Provides a docker image with added tools for monitoring.

Re-creates the official Telegraf docker container with the following tools added:
- `smartctl` (smartmontools)
- `ipmitool`
- `nvme-cli`
- `sensors` (lm-sensors)
- `mtr` (mtr-tiny)
- `sudo`

Built automatically by DockerHub Cloud. Use this image:
```
docker pull golift/telegraf
```

**In addition to sudo being installed, sudoers entries are added for `smartctl`, `ipmitool` and `nvme`.**
