#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="influxdb2"            # change if needed
BACKUP_ROOT="/var/backups/influxdb2" # host backup root
DATESTAMP=$(date +%Y%m%d_%H%M)
BACKUP_DIR="${BACKUP_ROOT}/backup_${DATESTAMP}"
CONTAINER_TMP="/var/lib/influxdb2/backup_${DATESTAMP}"

mkdir -p "${BACKUP_DIR}"

echo "Creating InfluxDB 2.x backup in container path: ${CONTAINER_TMP}"
docker exec "${CONTAINER_NAME}" influx backup "${CONTAINER_TMP}"

echo "Copying backup files to host: ${BACKUP_DIR}"
# NOTE the trailing '/.' — copies *contents* of the folder
docker cp "${CONTAINER_NAME}:${CONTAINER_TMP}/." "${BACKUP_DIR}/"

echo "Cleaning up temp backup in container"
docker exec "${CONTAINER_NAME}" rm -rf "${CONTAINER_TMP}"

# Optional: make files owned by your user instead of root
# chown -R $(id -u):$(id -g) "${BACKUP_DIR}"

echo "Done. Files in ${BACKUP_DIR}:"
ls -al "${BACKUP_DIR}"
