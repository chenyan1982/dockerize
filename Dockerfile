FROM ubuntu:14.04
USER root 

RUN apt-get update -yq \
	&& apt-get upgrade -yq

# Install re-requisites
RUN apt-get install -yq --no-install-recommends \
        gcc \
        g++ \
        make \
        python \
        adduser \
	git
	
# Download node source package and install  
RUN git clone --recursive git://github.com/nodejs/node.git
WORKDIR /node
RUN ./configure
RUN make
RUN make install

# Install generator of hubot
WORKDIR /
RUN npm install -g \
	yo \
	bower \
	grunt-cli \
	generator-hubot
	
# Add an xroot user because grunt doesn't like being root 
RUN adduser --disabled-password --gecos "" xroot && \
	echo "xroot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER xroot

# Create bot	
ENV HUBOT_NAME myhubot
RUN mkdir $HUBOT_NAME
WORKDIR /$HUBOT_NAME
RUN yo hubot --owner="Sky.Y.Chen <chenyanhasmail@gmail.com>" \
	--name="yaya" \
	--description="丫丫机器人" \
	--adapter=QQ \
	--default
	
	
