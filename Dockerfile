FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./PI01_DATA05/app /app
WORKDIR /app
RUN pip install pandas
EXPOSE 80