## LeNet/BigDL 

#### Notebooks for LetNet/BigDL deep learning workshop

The workshop environment is available for download in a Docker container. You can run it locally. The contrainer comes with the following pre-installed systems/libraries:

- Ubuntu Linux base image
- Spark
- BigDL
- Python 2
- Anaconda and related Python packages: NumPy, Scikit, etc.
- Tensorboard

**Important:** docker containers are not persistent. All your changes will be lost on restart. Download any copies of the notebooks you want to preserve to your local computer.

### Installation on Mac/Linux

##### Install Docker service

Go to [https://www.docker.com/community-edition#/download](https://www.docker.com/community-edition#/download), download an appropriate installation, and install Docker. 


##### Start Docker

Run Docker application. To confirm that you have docker running run the command:

```bash
sudo docker ps
```

This will show running containers. You should see an empty list, but you shouldn't see any errors.

##### Download the Docker image

In Terminal, run a command

```bash
sudo docker pull kalininalex/lenet-bigdl
```

Docker will download the image.

##### Run the Image

In Terminal, run a command

```bash
sudo docker run -p 8888:8888 -p 6006:6006 -it kalininalex/lenet-bigdl
```

The docker container will start, and print, among other things, a message that looks like:

```text
  Copy/paste this URL into your browser when you connect for the first time,
  to login with a token:
      http://localhost:8888/?token=805eaa91983ae4b25c7bf325a59cefbb113202c6b0254321
```

Copy and paste it into your browser and you should see a Jupyter environment. 

Navigate to **notebooks\Workshop-1**, and click on **1. MNIST with LeNet-BigDL.ipynb**. The notebook will launch and you can start executing cells.

##### Monitor Training with Tensorboard

The Docker container will launch Tensorboard dashboard. You can access it via a URL:

[http://localhost:6006/](http://localhost:6006/)

