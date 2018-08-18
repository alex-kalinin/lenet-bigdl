FROM ubuntu:latest
WORKDIR /root
RUN apt-get update --fix-missing 
RUN apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion vim unzip
COPY jupyter_notebook_config.py ./
COPY install-bigdl.sh ./
RUN bash -i install-bigdl.sh
COPY start-notebook ./
RUN git clone https://github.com/alex-kalinin/bigdl-notebooks.git
CMD ["/bin/bash", "-i", "/root/start-notebook"]
