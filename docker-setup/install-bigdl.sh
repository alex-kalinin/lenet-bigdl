#!/bin/bash	 

set -e

cd ~
apt-get update --fix-missing 
apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion unzip vim

wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh 
/bin/bash ~/miniconda.sh -b -p /opt/conda
rm ~/miniconda.sh
ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
echo "conda activate base" >> ~/.bashrc

source ~/.bashrc

conda create -y -n py35 python=3.5
source activate py35

pip install --upgrade pip

conda install -y numpy
conda install -y pandas
conda install -y jupyter
conda install -y matplotlib
pip install python-mnist
pip install Image

apt-get -y install apt-utils
conda install -y -c reeder java-jdk

pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.4.0-cp35-cp35m-linux_x86_64.whl

java -version

export SPARK_NAME=spark-2.2.0-bin-hadoop2.7
wget https://d3kbcqa49mib13.cloudfront.net/${SPARK_NAME}.tgz
tar xzf ${SPARK_NAME}.tgz
rm ${SPARK_NAME}.tgz

export BIGDL_VER=0.6.0
export BIGDL_NAME=dist-spark-2.2.0-scala-2.11.8-all-${BIGDL_VER}-dist
wget https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.2.0-scala-2.11.8-all/${BIGDL_VER}/${BIGDL_NAME}.zip

mkdir ${BIGDL_NAME}
mv *.zip ${BIGDL_NAME}
cd ${BIGDL_NAME}
unzip *.zip
rm *.zip
cd ..

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem -subj "/C=US/ST=California/L=San Francisco/O=alex kalinin/CN=kalinin.co"

mkdir ~/.jupyter
mv jupyter_notebook_config.py ~/.jupyter/
