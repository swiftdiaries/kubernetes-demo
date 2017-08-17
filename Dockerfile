FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Adhita Selvaraj <adhita.selvaraj@stonybrook.edu>

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get install -qq -y \
	git \
	&& rm -rf /var/lib/apt/lists/*

RUN cd && git clone https://github.com/swiftdiaries/tensorflow-gpu-setup setupscripts/

RUN export LD_LIBRARY_PATH=/usr/local/nvidia${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"