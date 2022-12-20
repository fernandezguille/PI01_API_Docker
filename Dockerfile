FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./app /usr/src/app
WORKDIR /usr/src/app
RUN pip install pandas
EXPOSE 80