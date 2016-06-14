FROM resin/rpi-raspbian
MAINTAINER Sylvain POULAIN <sylvain.poulain@giscan.com> /docker-RTKtouch
#Install dependencies
RUN apt-get update && apt-get install -y --install-recommends \
libxtst-dev build-essential libqt4-dev qt4-qmake git evince

# Replace 1000 with your user / group id
#RUN export uid=$USER gid=$USER && \
#    mkdir -p /home/pi && \
#    echo "pi:x:${uid}:${gid}:pi,,,:/home/pi:/bin/bash" >> /etc/passwd && \
#    echo "pi:x:${uid}:" >> /etc/group && \
#    echo "pi ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/pi && \
#    chmod 0440 /etc/sudoers.d/pi && \
#    chown ${uid}:${gid} -R /home/pi
    
#Download setup.sh and run it to install RTKtouch
ADD setup.sh /setup.sh
RUN chmod +x /setup.sh
RUN /setup.sh
ADD rtkbase /usr/bin/rtkbase
RUN chmod +x /usr/bin/rtkbase

#USER pi
#ENV HOME /home/pi
CMD export QT_GRAPHICSSYSTEM="native" ; /usr/bin/rtkbase
