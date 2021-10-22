FROM python:3.8-slim as production


ENV PYTHONUNBUFFERED=1
WORKDIR /app/


RUN apt-get update && \
    apt-get install && \
    openssl

RUN apt-get -y install python3.8-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y postgresql gcc python3-dev musl-dev
RUN apt-get install -y bash
RUN apt-get install -y build-essential
RUN apt-get install -y postgresql-client

COPY requirements/prod.txt ./requirements/prod.txt
RUN pip install -r ./requirements/prod.txt

COPY . .


EXPOSE 8000

#greate another version for development

FROM production as development

COPY requirements/dev.txt ./requirements/dev.txt
RUN pip install -r ./requirements/dev.txt

COPY . .
