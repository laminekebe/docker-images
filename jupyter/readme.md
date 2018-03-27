# Jupyter

To run this image, use something like:

```
docker run \
    --rm \
    opendatacube/jupyter \
    jupyter notebook --ip="*" --NotebookApp.token='secretpassword'
```

The image comes with the standard ODC installed, including the entrypoint that sets the config from the environment.