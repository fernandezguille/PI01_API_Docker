FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./app /usr/src/app/app
COPY ./Datasets /usr/src/app/app/Datasets
WORKDIR /usr/src/app
RUN pip install pandas
EXPOSE 80