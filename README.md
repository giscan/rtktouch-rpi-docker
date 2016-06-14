**# rtktouch-rpi-docker**
Docker Rtktouch fro Raspberry Pi (GUI for Rtklib) from Francklin : https://github.com/Francklin2/RTKLIB_Touchscreen_GUI

It's just a docker container for software of Francklin

**How to build it : **

docker docker build -t giscan/rtktouch-rpi-docker git://github.com/giscan/rtktouch-rpi-docker


**How to use it (/dev/ttyUSB0 is your GPS) : **

docker run -it --device=/dev/ttyUSB0 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix giscan/rtktouch-rpi-docker

