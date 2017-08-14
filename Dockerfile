FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Adhita Selvaraj <adhita.selvaraj@stonybrook.edu>

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get install -qq -y \
	git \
	&& rm -rf /var/lib/apt/lists/*

RUN cd && git clone https://github.com/swiftdiaries/tensorflow-gpu-setup setupscripts/

RUN apt-get install software-properties-common

RUN add-apt-repository ppa:graphics-drivers

RUN apt-get update

RUN apt install -y nvidia-375

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"