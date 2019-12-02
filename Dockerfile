FROM ubuntu:latest
MAINTAINER PH
WORKDIR /var/www
COPY . /var/www
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    python3 \
    python3-pip \
	python3-setuptools \
    less \
	&& pip3 install --upgrade pip \
	&& apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli
RUN pip3 install awscli --upgrade --user

WORKDIR /var/www
RUN pip install -r requirements.txt

CMD ["/bin/bash"]
