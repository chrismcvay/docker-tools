FROM ubuntu:18.04

RUN apt-get update && apt-get -y install sudo build-essential codeblocks

#COPY versions/ /versions
#RUN tar xf /versions/codeblocks_17.12-1_amd64_stable.tar.xz
#RUN apt install /versions/codeblocks_17.12-1_amd64_stable.deb

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer

CMD codeblocks

