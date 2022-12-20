FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./app /usr/src/app
COPY ./Datasets /usr/src/app/Datasets
WORKDIR /usr/src/app
RUN pip install pandas
EXPOSE 80