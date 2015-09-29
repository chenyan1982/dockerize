FROM ubuntu:14.04
USER root 

RUN apt-get update -y \
	&& apt-get upgrade -y

# Install git
RUN apt-get install -y --no-install-recommends \
        gcc \
        g++ \
        make \
	git
	
# Download node source package and install  
RUN git clone --recursive git://github.com/nodejs/node.git

