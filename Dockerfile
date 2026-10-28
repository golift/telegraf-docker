FROM telegraf:1.40@sha256:236f73ce796622bda52135f8203f900dcbdd41aa46894fd6074b948ce397f3a9

RUN apt update && apt install -y --no-install-recommends \
  sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
  rm -rf /var/lib/apt/lists/* && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
  echo "Ubuntu done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"
