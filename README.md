# telegraf-docker

Provides a docker image with added tools for monitoring.

Re-creates the official Telegraf docker container with the following tools added:
- `smartctl` (smartmontools)
- `ipmitool`
- `nvme-cli`
- `sensors` (lm-sensors)
- `mtr` (mtr-tiny)

Built automatically by DockerHub Cloud. Use this image:
```
docker pull golift/telegraf
```

## TODO

- multi-arch
