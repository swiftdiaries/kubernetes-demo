FROM nvidia/cuda:8.0-cudnn5-runtime-ubuntu16.04

MAINTAINER Adhita Selvaraj <adhita.selvaraj@stonybrook.edu>

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get install -qq -y \
	git \
	&& rm -rf /var/lib/apt/lists/*

RUN cd && git clone https://github.com/swiftdiaries/tensorflow-gpu-setup setupscripts/

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"