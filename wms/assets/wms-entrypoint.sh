#!/usr/bin/env bash
set -e

get_wms_config.sh
# Fix certificate issues
mkdir -p /etc/pki/tls/certs
ln -s /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt;
docker-entrypoint.sh "$@"
