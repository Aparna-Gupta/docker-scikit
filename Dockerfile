FROM ubuntu:14.04

# Install Yaafe
RUN apt-get update
RUN apt-get install wget build-essential git python -y

# APP
RUN apt-get install python-pip python-dev -y

RUN pip install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
#RUN pip install -r /tmp/requirements.txt

RUN pip install scipy
RUN pip install numpy
RUN pip install scikit-learn

COPY src /opt/docker-scikit
