FROM python:3.10-alpine

LABEL maintainer="Container Solutions <info@container-solutions.com>"

# Install basic dependencies
RUN apk add --no-cache curl git parallel

# Silence parallel citation notice
RUN mkdir /root/.parallel && \
    touch /root/.parallel/will-cite

# Install pip (should already exist in python:3.10 images, but kept for clarity)
# curl https://bootstrap.pypa.io/get-pip.py | python

# Install grafanalib
RUN pip install --no-cache-dir git+https://github.com/weaveworks/grafanalib@82556ddfbbd6134837d280a7999d35c45cc3c87e

WORKDIR /opt/code

CMD ["/bin/sh", "-c"]

