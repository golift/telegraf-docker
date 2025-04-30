FROM telegraf:1.34@sha256:b6408072c5f1b2673b70cdef979ee7f7e06dae14d0c02c294e82a09d5586abe5

RUN apt update && apt install -y --no-install-recommends \
  sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
  rm -rf /var/lib/apt/lists/* && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
  echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
  echo "Ubuntu done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"
