FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install \
	debconf \
	gconf-service \
	lib32gcc1 \
	lib32stdc++6 \
	libarchive13 \
	libasound2 \
	libc6 \
	libc6-i386 \
	libcairo2 \
	libcap2 \
	libcups2 \
	libdbus-1-3 \
	libexpat1 \
	libfontconfig1 \
	libfreetype6 \
	libgcc1 \
	libgconf-2-4 \
	libgdk-pixbuf2.0-0 \
	libgl1-mesa-glx \
	libglib2.0-0 \
	libglu1-mesa \
	libgtk2.0-0 \
	libnspr4 \
	libnss3 \
	libpango1.0-0 \
	libpng12-0 \
	libsoup2.4-1 \
	libstdc++6 \
	libx11-6 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxtst6 \
	npm \
	sudo \
	zlib1g

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

RUN mkdir /unity-install
RUN mkdir /unity-install/download
COPY unity-versions/ /unity-install
RUN chmod +x /unity-install/*

RUN echo 'y' | /unity-install/UnitySetup-2017.4.6f1 --unattended --install-location=/unity --download-location=/unity-install/download


WORKDIR "/unity/Editor"
USER developer

CMD "./Unity"


