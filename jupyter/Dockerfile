FROM opendatacube/datacube-core

# Get dependencies for Jupyter
RUN apt-get update && apt-get install -y \
    ipython ipython-notebook \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install \
    jupyter matplotlib \
    && rm -rf $HOME/.cache/pip

# Copy configuration of Jupyter from https://github.com/jupyter/docker-stacks/
# Configure environment
ENV NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100
ENV HOME=/home/$NB_USER

ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/fix-permissions /usr/local/bin/fix-permissions
RUN chmod +x /usr/local/bin/fix-permissions 
# Create jovyan user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    chmod g+w /etc/passwd /etc/group && \
    fix-permissions $HOME


# TODO: Ensure that these are all required and sensible for ODC purposes...
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/start.sh /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/start-notebook.sh /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/start-singleuser.sh /usr/local/bin/
ADD https://raw.githubusercontent.com/jupyter/docker-stacks/master/base-notebook/jupyter_notebook_config.py /etc/jupyter/
RUN chmod +rx /usr/local/bin/start.sh \
    && chmod +rx /usr/local/bin/start-notebook.sh \
    && chmod +rx /usr/local/bin/start-singleuser.sh \
    && chmod +rx /etc/jupyter/jupyter_notebook_config.py
RUN fix-permissions /etc/jupyter/

# Set up the environment
WORKDIR $HOME
EXPOSE 8888
CMD ["start-notebook.sh"]

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
