FROM ubuntu:14.04
USER root 

RUN apt-get update -y \
	&& apt-get upgrade -y

# Install re-requisites
RUN apt-get install -y --no-install-recommends \
        gcc \
        g++ \
        make \
        python \
	git
	
# Download node source package and install  
RUN git clone --recursive git://github.com/nodejs/node.git
WORKDIR /node
RUN ./configure
RUN make
RUN make install

# Install Yeoman
WORKDIR /
RUN npm install -g yo


