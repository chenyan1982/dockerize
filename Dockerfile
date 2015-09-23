FROM ubuntu:14.04
MAINTAINER Sky.Y.Chen <chenyanhasmail@gmail.com>
RUN apt-get -y update
RUN apt-get install -yf \
		openjdk-7-jdk \
		mysql-server \
		scala \
		git
		
#RUN git clone --depth 1 https://github.com/dropbox/hackpad.git		
EXPOSE 9000
CMD ["/bin/bash"]
		
#RUN mkdir /etc/hackpad
#VOLUME /etc/hackpad/srcS
#COPY bin/docker-entry-point.sh /etc/hackpad/
#ENTRYPOINT ["/etc/hackpad/docker-entrypoint.sh"]
#EXPOSE 9000
#CMD ["hackpad"]
