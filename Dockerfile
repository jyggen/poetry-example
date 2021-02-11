FROM python:3.7-slim
ENV POETRY_HOME=/usr/local/poetry
ENV POETRY_VERSION=1.1.4
RUN apt-get update && apt-get install -y wget \
  && wget https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py \
  && python get-poetry.py
ENV PATH="/usr/local/poetry/bin:${PATH}"
COPY . /build
WORKDIR /build/app
RUN poetry export --without-hashes -f requirements.txt > requirements.txt
RUN  cat requirements.txt && ls /build && pip install -r requirements.txt
