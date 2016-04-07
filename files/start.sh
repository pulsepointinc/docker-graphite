#!/bin/bash

## Support setting TIME_ZONE through env
[ -z "${TIME_ZONE}" ] || {
  echo "Setting TIME_ZONE to ${TIME_ZONE}" >&2
  echo "TIME_ZONE='${TIME_ZONE}'" > /var/lib/graphite/webapp/graphite/local_settings.py 
}

## Support setting storage schema through env
[ -z "${STORAGE_SCHEMA}" ] || {
  CARBON_SCHEMA=${CARBON_SCHEMA:-1m:90d}

  cat >/var/lib/graphite/conf/storage-schemas.conf << EOF
[carbon]
pattern = ^carbon\.
retentions = ${CARBON_SCHEMA}

[default]
pattern = .*
retentions = ${STORAGE_SCHEMA}
EOF
  echo "Running with storage-schema:" >&2
  cat /var/lib/graphite/conf/storage-schemas.conf >&2
}

exec /usr/bin/supervisord
