FROM nvidia/cuda:9.0-devel-ubuntu16.04

RUN apt-get update \
    && apt-get -y install python3 \
    python3-pip \
    python3-dev \
    libgl1 \
    git

RUN pip3 install --upgrade pip
RUN pip3 install setuptools

WORKDIR /workspace
ADD . .

RUN chmod -R a+w /workspace

EXPOSE 8000
