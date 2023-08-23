FROM python:3.9-alpine

COPY ./cat-app /cat-app

RUN pip install Flask

CMD [ "python", "/cat-app/app.py" ]

EXPOSE 5000