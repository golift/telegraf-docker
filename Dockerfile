FROM telegraf:1.27@sha256:2c9fbcdaa329b35b763b174bbe96dd11d078f187ae1f4a974e525e3692810ccd

RUN apt update && apt install -y --no-install-recommends \
       sudo mtr-tiny lm-sensors smartmontools ipmitool nvme-cli && \
        rm -rf /var/lib/apt/lists/* && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/smartctl *' | tee    /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/sbin/nvme *'     | tee -a /etc/sudoers.d/telegraf && \
        echo 'telegraf ALL=NOPASSWD:/usr/bin/ipmitool *'  | tee -a /etc/sudoers.d/telegraf && \
        echo "Done."

LABEL org.opencontainers.image.source="https://github.com/influxdata/telegraf" \
      org.opencontainers.image.url="https://github.com/golift/telegraf-docker"

