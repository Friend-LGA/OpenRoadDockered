# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Europe/UTC"
RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential git
RUN git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
RUN ./OpenROAD/etc/DependencyInstaller.sh -dev
RUN ./OpenROAD/etc/Build.sh
ENTRYPOINT ["/OpenROAD/build/src/openroad"]
