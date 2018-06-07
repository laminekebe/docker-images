FROM opendatacube/datacube-core

RUN apt-get update && apt-get install -y npm nodejs
RUN npm install -g configurable-http-proxy

# Get dependencies for Jupyter
RUN pip3 install \
    jupyter jupyterhub matplotlib folium \
    && rm -rf $HOME/.cache/pip

RUN mkdir /conf && chmod -R 777 /conf
ENV DATACUBE_CONFIG_PATH=/conf/datacube.conf
ENV DB_DATABASE=opendatacube
ENV DB_HOSTNAME=db
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=secretpassword
ENV DB_PORT=5432

RUN chmod -R 777 /opt/odc

ENV HOME=/opt/notebooks
RUN mkdir -p $HOME && chmod -R 777 $HOME && echo "datacube --version" > $HOME/test.py

WORKDIR $HOME

CMD ["jupyterhub", "--ip=\"*\""]
