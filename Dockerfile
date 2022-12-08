FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./PI01_DATA05 /usr/src/app
COPY ./PI01_DATA05/Datasets /usr/src/app
RUN pip install pandas
EXPOSE 80