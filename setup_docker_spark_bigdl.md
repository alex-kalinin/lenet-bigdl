### Build Docker Container with Spark and BigDL

1) Install docker locally.

2) Get the project from git:
```
git pull https://github.com/alex-kalinin/lenet-bigdl
```

3) Build the docker container:
```
cd lenet-bigdl\docker
docker build -t kalininalex/lenet-bigdl-base -f Dockerfile.py35 .
```

4) Push docker to [hub.docker.com](http://hub.docker.com):

```
docker push kalininalex/lenet-bigdl-base
```

5) You can now follow steps to create a complete AMI using the latest Spark/BigDL docker by following steps in [create_ami_with_docker.md](./create_ami_with_docker.md).