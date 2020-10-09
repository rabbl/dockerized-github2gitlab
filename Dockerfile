FROM python:2.7-alpine3.7

ENV PBR_VERSION=1.5.6

RUN apk add --update --no-cache git

RUN git clone https://github.com/rabbl/github2gitlab.git src

WORKDIR /src

RUN pip install --no-cache-dir -e .
