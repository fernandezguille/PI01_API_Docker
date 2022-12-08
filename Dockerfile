FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./PI01_DATA05 /usr/src/app
WORKDIR /usr/src/app
RUN pip install pandas
EXPOSE 80