###############################################################################
#                           Header Documentation                              #
###############################################################################


###############################################################################
#                                   Header                                    #
############################################################################### 
FROM ubuntu:14.04
MAINTAINER Sky.Y.Chen <chenyanhasmail@gmail.com>

###############################################################################
#                            Environment Variables                            #
###############################################################################
# Tar files downloaded to tmp directory
ENV TMP_DIR /tmp

# Docker user to be created to intereact with container. This user is 
# different than root
ENV DOCKER_USER=docker

# Password for the user defined by DOCKER_USER environment 
# variable
ENV DOCKER_USER_PASSWORD=docker

# Password for the root 
ENV ROOT_USER_PASSWORD=root

# Hubot name	
ENV HUBOT_NAME=myhubot


###############################################################################
#                                Instructions                                 #
###############################################################################
# Install dependencies
RUN apt-get update -yq \
	&& apt-get upgrade -yq

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

# Install following components using npm 
# - Yeoman 
# - Yeoman Hubot Generator 
# - Bower 
# - Grunt-Cli 
# - Gulp 
WORKDIR /
RUN npm install -g \
	yo \
	bower \
	grunt-cli \
	gulp \
	generator-hubot
	
# Set the root password 
RUN echo "root:${ROOT_USER_PASSWORD}" | chpasswd	
	
# Create new user called define by DOCKER_USER environment variable 
# which will be able to work with yeoman. 
# Following issue prohibits using root with yo command 
# https://github.com/yeoman/yeoman.io/issues/282 
RUN adduser --disabled-password --shell /bin/bash --gecos '' ${DOCKER_USER}

# Add user defined by DOCKER_USER environment variable to the sudoers list 
RUN adduser ${DOCKER_USER} sudo

# Set the work directory to home dir of the root 
WORKDIR /home/${DOCKER_USER}

VOLUME /home/${DOCKER_USER}
	
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the user id 
USER ${DOCKER_USER}

# Generate a hubot
# ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
	


# Don't deploy on Heroku	
# RUN vi +/heroku external-scripts.json && :d && :wq

# ENTRYPOINT ["bin/hubot"]
	
###############################################################################
#                                    End                                      #
############################################################################### 
