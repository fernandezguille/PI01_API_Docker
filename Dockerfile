FROM tiangolo/uvicorn-gunicorn-fastapi
COPY . /usr/src/app
COPY Datasets /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r requirements.txt
ENTRYPOINT uvicorn --host 0.0.0.0 main:app --reload
EXPOSE 80