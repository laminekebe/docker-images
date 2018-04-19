# WMS

This image is built from this repo: https://github.com/opendatacube/datacube-wms

To run this image, use something like:

```
docker run \
    --rm \
    opendatacube/wms \
    gunicorn -b '0.0.0.0:8000' -w 5 --timeout 300 datacube_wms:wms
```

Also not the Docker Compose file showing how to run the app with a database and Nginx proxy. You can start this with `docker-compose up`.

The image comes with the standard ODC installed, including the entrypoint that sets the config from the environment.
