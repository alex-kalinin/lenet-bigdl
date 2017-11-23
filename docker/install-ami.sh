#!/bin/bash

sudo apt-get update

curl -O https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh

export PATH=/home/ubuntu/anaconda3/bin:$PATH

conda create -y -n py27 python=2.7 anaconda
conda install -y -c reeder java-jdk
source activate py27

conda install -y -c reeder java-jdk

wget https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
tar xzf spark-2.2.0-bin-hadoop2.7.tgz

wget https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.2.0-scala-2.11.8-linux64/0.3.0/dist-spark-2.2.0-scala-2.11.8-linux64-0.3.0-dist.zip
sudo apt-get -y install unzip

mkdir dist-spark-2.2.0-scala-2.11.8-linux64-0.3.0-dist
mv *.zip dist-spark-2.2.0-scala-2.11.8-linux64-0.3.0-dist
cd dist-spark-2.2.0-scala-2.11.8-linux64-0.3.0-dist
unzip *.zip
cd ..

pip install python-mnist
pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.3.0-cp27-none-linux_x86_64.whl

cd lenet-bigdl/docker
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem
