FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python python-setuptools python-pip ca-certificates build-essential python3-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev libyaml-dev curl

COPY . /tmp/

RUN cd /tmp/ && \
    pip install pyasn1 && \
    python setup.py install && \
    mv /tmp/entrypoint.sh /entrypoint.sh && \
    mv /tmp/config.yml /etc/vmware_exporter.yaml

CMD [ "/entrypoint.sh" ]
