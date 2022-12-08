FROM tiangolo/uvicorn-gunicorn-fastapi
COPY ./app /app
WORKDIR /app
RUN pip install pandas
EXPOSE 80