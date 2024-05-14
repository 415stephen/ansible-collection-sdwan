FROM ubuntu:22.04

ENV DOCKER_RUN  true

# Install required packages and remove the apt packages cache when done
RUN apt-get update && \
    apt-get install -y \
        git \
        python3.10 \
        python3-pip \
        && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN git clone https://github.com/cisco-open/ansible-collection-sdwan

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools 
RUN pip3 install awscli

RUN pip3 install -r /ansible-collection-sdwan/requirements.txt --no-deps
RUN ansible-galaxy install -r /ansible-collection-sdwan/requirements.yml

RUN /usr/bin/sleep infinity 
