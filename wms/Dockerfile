FROM opendatacube/datacube-core

RUN pip3 install \
    flask scikit-image gunicorn \
    && rm -rf $HOME/.cache/pip

RUN apt-get update && apt-get install -y \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/code
ADD https://api.github.com/repos/opendatacube/datacube-wms/git/refs/heads/mdba version.json
RUN wget https://github.com/opendatacube/datacube-wms/archive/mdba.zip -O /tmp/dashboard.zip \
    && unzip /tmp/dashboard.zip \
    && mv /tmp/code/datacube-wms-mdba /code

WORKDIR /code

RUN python3 setup.py install

COPY assets/wms-entrypoint.sh /usr/local/bin/wms-entrypoint.sh
COPY assets/get_wms_config.sh /usr/local/bin/get_wms_config.sh

ENTRYPOINT ["wms-entrypoint.sh"]

CMD gunicorn -b '0.0.0.0:8000' -w 1 --timeout 300 datacube_wms:wms
