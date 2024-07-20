FROM python:3.12-alpine

COPY . /app
WORKDIR app

RUN pip install pipenv
RUN pipenv install

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

ENTRYPOINT [ "pipenv", "run", "waitress-serve", "--port=8000", "app.hello:app"]
