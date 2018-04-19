# Jupyter

To run this image, use something like:

```
docker run \
    --rm \
    opendatacube/jupyter \
    jupyter notebook --ip="*" --NotebookApp.token='secretpassword'
```

The image comes with the standard ODC installed, including the entrypoint that sets the config from the environment.

There is also a simple Docker Compose file, so you can run the application with Postgres as well like this:

```
    docker-compose up
```

## Environment variables
You can change the name of the unprivileged user that Jupyter runs as by setting the environment variable `NB_USER` to something.
