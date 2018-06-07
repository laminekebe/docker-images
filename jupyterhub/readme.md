# JupyterHub

To run this image, use something like:

```
docker run \
    --rm \
    opendatacube/jupyterhub \
    jupyterhub --ip="*"
```

The image comes with the standard ODC installed, including the entrypoint that sets the config from the environment.

There is also a simple Docker Compose file, so you can run the application with Postgres as well like this:

```
    docker-compose up
```

Note that the current version requires you to add a user to the docker container when it's running.
