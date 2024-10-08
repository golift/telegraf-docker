FROM telegraf:1.32@sha256:67d37340cdccd4844c124fd187b31ef7244e9e3b0b63e739291ab5b03ff392b0

RUN apt update && apt install -y --no-install-recommends \
  sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
  rm -rf /var/lib/apt/lists/* && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
  echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

