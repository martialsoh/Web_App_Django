FROM python:3.8-slim as production


ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /app/


RUN apt-get update && \
    apt-get install && \
    openssl

RUN apt-get -y install python3.8-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y postgresql-13 gcc python3-dev musl-dev
RUN apt-get install -y bash
RUN apt-get install -y build-essential
RUN apt-get install -y postgresql-client-13

COPY requirements ./requirements
RUN pip install -r ./requirements/prod.txt

COPY . .


EXPOSE 8000

#greate another version for development

FROM production as development

COPY requirements ./requirements
RUN pip install -r ./requirements/dev.txt

COPY . .