# Version: 1.0
# Name: datacubecore
# for Python 3.6

FROM csirodatacube/odc-dev:1.2

MAINTAINER "bo.yan@csiro.au"

# In case someone loses the Dockerfile
RUN rm -rf /etc/Dockerfile
COPY Dockerfile /etc/Dockerfile

# set environment variables
ENV WORK_BASE /var/agdc
ENV DATACUBE_CONFIG_DIR "$WORK_BASE"/config
ENV DATACUBE_DATA_DIR "$WORK_BASE"/data
ENV DATACUBE_OUTPUT_DIR "$WORK_BASE"/output
ENV LATEST_RELEASE datacube-1.5.2

# must run with user root
USER root

# create directories
RUN mkdir -p "$DATACUBE_CONFIG_DIR" && \
    mkdir -p "$DATACUBE_DATA_DIR" && \
    mkdir -p "$DATACUBE_OUTPUT_DIR"

# copy configuration files to image, and create links to /root 
COPY datacube.conf "$DATACUBE_CONFIG_DIR"
COPY pgpass "$DATACUBE_CONFIG_DIR"
RUN ln -sf "$DATACUBE_CONFIG_DIR"/datacube.conf /root/.datacube.conf && \
    ln -sf "$DATACUBE_CONFIG_DIR"/pgpass /root/.pgpass  && \
    chmod 0600 /root/.pgpass

# change to work directory
WORKDIR "$WORK_BASE"

# download and build datacube-core develop branch
# https://github.com/opendatacube/datacube-core/
RUN git clone https://github.com/opendatacube/datacube-core && \
	cd datacube-core && \
	git checkout tags/"$LATEST_RELEASE"

# change to source directory
WORKDIR "$WORK_BASE"/datacube-core

RUN python setup.py install

