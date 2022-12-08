FROM tiangolo/uvicorn-gunicorn-fastapi
COPY . /usr/src/app
COPY Datasets /usr/src/app
RUN pip install pandas
EXPOSE 80