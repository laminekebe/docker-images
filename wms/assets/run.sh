#!/bin/sh

./get_wms_config.sh
gunicorn -b '0.0.0.0:8000' -w 1 --timeout 300 datacube_wms:wms
