#!/bin/sh
# download the code locally
git submodule init
git submodules update

# install the local code
uv pip install -e tools/NGIAB_data_preprocess
uv pip install -e tools/ngiab-cal


# building nextgen in a box
docker build -t my_ngiab tools/NGIAB-CloudInfra/docker/
# change the ngen-cal base image by editing tools/ngen-cal/Dockerfile or running the command below
sed -i 's/awiciroh\/ciroh-ngen-image/my_ngiab/' tools/ngen-cal/Dockerfile
# Optionally patch the preprocessors --run command (this workshop won't use it)
sed -i 's/awiciroh\/ciroh-ngen-image:latest /my_ngiab /g' tools/NGIAB_data_preprocess/modules/ngiab_data_cli/__main__.py

## build ngen-cal image
docker build -t ngiab_cal tools/ngen-cal/
# patch ngiab-cal --run to use your image
sed -i 's/DOCKER.*/DOCKER_IMAGE_NAME = "ngiab_cal"/g' tools/ngiab-cal/src/ngiab_cal/__main__.py
