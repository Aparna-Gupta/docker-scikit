FROM ubuntu:14.04

# Install Yaafe
RUN apt-get update
RUN apt-get install wget build-essential git python -y

# APP
RUN apt-get install python-pip python-dev -y

RUN pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY src /opt/docker-scikit

RUN apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

#ADD http://people.csail.mit.edu/jrennie/20Newsgroups/20news-bydate.tar.gz /tmp/
RUN wget http://people.csail.mit.edu/jrennie/20Newsgroups/20news-bydate.tar.gz -O /opt/20news-bydate.tar.gz 

WORKDIR /opt

RUN mkdir -p /opt/20news-bydate/

RUN mkdir -p /opt/output/

RUN chmod 777 -R /opt/

RUN mv /opt/20news-bydate.tar.gz /opt/20news-bydate

WORKDIR /opt/20news-bydate

RUN tar -xzvf 20news-bydate.tar.gz

RUN ls -l /opt/

#CMD ["/bin/bash"]
