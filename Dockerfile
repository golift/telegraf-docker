FROM telegraf:1.33@sha256:680458a3a0a4697b23a6b2d390991f7afd55589b734a9b1ff76b67045159ccbb

RUN apt update && apt install -y --no-install-recommends \
  sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
  rm -rf /var/lib/apt/lists/* && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
  echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

