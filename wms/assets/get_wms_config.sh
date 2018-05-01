#!/bin/sh

if [ "$WMS_CONFIG_URL" ]
then
   wget "$WMS_CONFIG_URL" -O /code/datacube_wms/wms_cfg.py
fi
