# Dashboard

A simple dashboard that lets you view what data is loaded into your ODC instance. See [here for reference](https://github.com/data-cube/dea-dashboard).

To run this image, use something like:

```
docker run \
    --rm \
    -p 8000:8000
    opendatacube/dashboard \
    gunicorn -b '0.0.0.0:80' -w 1 --timeout 300 cubedash:app
```

The image comes with the standard ODC installed, including the entrypoint that sets the config from the environment.

There is also a simple Docker Compose file, so you can run the application with Postgres and an Nginx proxy as well like this:

```
    docker-compose up
```

## Usage
See the documentation at the main site, but most importantly, you need to generate the summary information that this application relies on. You can do that with this command:

```
    python3 -m cubedash.generate --all
```

In order to run this, you need to be in the Docker container. The easy way to do this is using Docker Compose. So, first get it running, with `docker-compose up` and then do `docker-compose exec dashboard python3 -m cubedash.generate --all`.
