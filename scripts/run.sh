#!/usr/bin/env bash

IMAGE="asssaf/browser-use"
VIDEO_GROUP=986
AUDIO_GROUP=995

docker run --rm -it \
        --name chrome \
	-e DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
        -v /dev/shm:/dev/shm \
        -v /home/$USER/.asoundrc:/home/user/.asoundrc:ro \
        -e DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" \
        -v /run/user/1000/bus:/run/user/1000/bus \
        -v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket \
        --device /dev/snd \
        --device /dev/dri \
        --group-add $VIDEO_GROUP \
        --group-add $AUDIO_GROUP \
	--user $(id -u):$(id -g) \
	-e GOOGLE_API_KEY \
        $IMAGE "$@"
