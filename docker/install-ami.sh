#/bin/bash

apt-get update

curl -O https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh

conda create -y -n py27 python=2.7 
source activate py27

pip install python-mnist
pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.3.0-cp27-none-linux_x86_64.whl

conda install -y -c cyclus java-jdk

wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz
tar xzf spark-2.1.1-bin-hadoop2.7.tgz

wget https://repo1.maven.org/maven2/com/intel/analytics/bigdl/dist-spark-2.1.1-scala-2.11.8-linux64/0.2.0/dist-spark-2.1.1-scala-2.11.8-linux64-0.2.0-dist.zip
sudo apt-get -y install unzip

mkdir dist-spark-2.1.1-scala-2.11.8-linux64-0.2.0-dist
mv *.zip dist-spark-2.1.1-scala-2.11.8-linux64-0.2.0-dist
cd dist-spark-2.1.1-scala-2.11.8-linux64-0.2.0-dist
unzip *.zip

