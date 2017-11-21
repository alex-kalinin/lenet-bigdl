#/bin/bash

sudo apt-get update

wget https://repo.continuum.io/miniconda/Miniconda2-4.3.27.1-Linux-x86_64.sh -O miniconda.sh
sudo bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

./install.p2.sh
