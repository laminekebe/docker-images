FROM opendatacube/datacube-core

RUN pip3 install \
    flask \
    && rm -rf $HOME/.cache/pip

RUN apt-get update && apt-get install -y \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/code
RUN wget https://github.com/data-cube/datacube-wms/master/next-core.zip -O /tmp/dashboard.zip \
    && unzip /tmp/dashboard.zip \
    && mv /tmp/code/dea-dashboard-master /code

WORKDIR /code

RUN python3 setup.py install

CMD gunicorn -b '0.0.0.0:8000' -w 1 --timeout 300 datacube_wms
