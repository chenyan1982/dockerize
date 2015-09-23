FROM ubuntu-upstart
MAINTAINER Sky.Y.Chen <chenyanhasmail@gmail.com>
RUN apt-get -y update
RUN apt-get install -yf \
		git
		
RUN git clone --depth 1 https://github.com/dropbox/hackpad.git
EXPOSE 9000
