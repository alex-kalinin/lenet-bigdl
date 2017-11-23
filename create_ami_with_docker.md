### Create AMI Instance with Spark/BigDL Docker

0. Create a new instance from Ubuntu AMI
0. sudo apt update
0. sudo apt install -y docker.io
0. sudo docker pull kalininalex/lenet-bigdl-base
0. docker run -v /home/ubuntu:/host -p 8888:8888 -p 6006:6006 --restart always --env CORES=4 -dit kalininalex/lenet-bigdl-base 
0. Test by connecting to https://<instance ip>:8888/
0. Copy necessary notebooks to /home/ubuntu:
	0. cd /home/ubuntu
	0. git clone https://github.com/alex-kalinin/spark-bigdl-notebooks
0. You can now shut down the instance, and create the AMI image. 

The docker will automatically launch lenet-bigdl-base contain upon the next instance start.
