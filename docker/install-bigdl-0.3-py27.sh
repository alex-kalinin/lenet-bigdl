#/bin/bash

apt-get update

conda create -y -n py27 python=2.7
source activate py27
conda install -y numpy
conda install -y pandas
conda install -y jupyter
conda install -y matplotlib
pip install python-mnist
pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.4.0-cp35-cp35m-linux_x86_64.whl

SPARK_VER=2.2.0
BIGDL_VER=0.3.0
SPARK_NAME=spark-${SPARK_VER}-bin-hadoop2.7
BIGDL_NAME=dist-spark-2.2.0-scala-2.11.8-linux64-0.3.0-dist

apt-get -y install sudo
sudo apt-get -y install apt-utils
conda install -y -c reeder java-jdk
wget https://d3kbcqa49mib13.cloudfront.net/${SPARK_NAME}.tgz
tar xzf ${SPARK_NAME}.tgz

wget https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-${SPARK_VER}-scala-2.11.8-linux64/${BIGDL_VER}/${BIGDL_NAME}.zip
sudo apt-get -y install unzip
sudo apt-get -y install vim

mkdir ${BIGDL_NAME}
mv *.zip ${BIGDL_NAME}
cd ${BIGDL_NAME}
unzip *.zip
cd ..

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem -subj "/C=US/ST=California/L=San Francisco/O=alex kalinin/CN=kalinin.co"

mkdir ~/.jupyter
mv jupyter_notebook_config.py ~/.jupyter/
