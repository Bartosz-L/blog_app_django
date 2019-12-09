# Dockerfile

# Pull base image
FROM python:3.8.0-alpine3.10
LABEL maintainer="Bartosz Ligęza"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV PORT=8000

# creae and set working directory
RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/

RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev

# install environment dependencies
RUN pip3 install --upgrade pip

# Install project dependencies
RUN pip3 install -r requirements.txt

RUN apk del .tmp-build-deps

COPY . /app/

RUN adduser -D user
RUN chown -R user:user .
USER user