#! /bin/bash

hostIP=$(ipconfig getifaddr en0)  # ip of wifi interface ! only for OSX
conHOME=/home/fdiblen

docker run \
    --privileged \
    -e DISPLAY=$hostIP:0 \
    -v $(pwd):$conHOME:rw  \
    --net host \
    -P -t -i archsci:latest $conHOME/.zshrc


