FROM ubuntu:14.04
MAINTAINER Sky.Y.Chen <chenyanhasmail@gmail.com>
USER root 

RUN apt-get update -y \
	&& apt-get upgrade -y

# Install git
RUN apt-get install -y --no-install-recommends \
	git
	
# Download node source package and install  
RUN git clone git://github.com/joyent/node.git
# Use latest version of winetricks from github RUN curl -SL 'http://winetricks.org/winetricks' -o /usr/local/bin/winetricks \
# 	&& chmod +x /usr/local/bin/winetricks
# Wine really doesn't like to be run as root, so let's use a non-root user USER xclient ENV HOME /home/xclient ENV WINEPREFIX /home/xclient/.wine # Tell wine to behave like a 32-bit Windows. # https://wiki.archlinux.org/index.php/Wine#WINEARCH ENV WINEARCH win32
# We have a development build of wine, which means tons of debug output. # Thus we should suppress it: https://www.winehq.org/docs/winedev-guide/dbg-control ENV WINEDEBUG -all # Use xclient's home dir as working dir WORKDIR /home/xclient
# RUN echo "alias winegui='wine explorer /desktop=DockerDesktop,1024xssss768'" > ~/.bash_aliases
