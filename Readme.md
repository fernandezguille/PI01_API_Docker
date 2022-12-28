<h1 align=center> INDIVIDUAL PROJECT 01 </h1>
<h2 align=center> EDA-ETL-FastAPI-Docker in Datasets of Streaming platforms</h2>

<br>

¡Hi! My name is *Guillermo Fernández* and this is my first individual project, which is part of the training for the Henry Data Science bootcamp.
(Para la versión en español, revisar el readme_es)

<hr>

## Objective
Input data from various sources, apply the transformations that are considered relevant, and then make the clean data available for consultation through an API in a docker virtual environment.

[Project description (in Spanish)](https://github.com/HX-FAshur/PI01_DATA05)

### Context
The amount of content available today on the platforms is constantly growing. For this work, datasets from the Amazon, Disney, Hulu and Netflix platforms were used.

<img src="https://user-images.githubusercontent.com/110403753/209761096-8cfd888f-62a3-4de9-83ac-605f4ce0a025.png" width="200px">
<img src="https://user-images.githubusercontent.com/110403753/209761412-26b311f6-6847-48b6-8c97-6dd020e93372.png" width="200px">
<img src="https://user-images.githubusercontent.com/110403753/209761331-68019653-f285-4d73-b225-2280dbb69e83.png" width="200px">
<img src="https://user-images.githubusercontent.com/110403753/209761759-d7701724-a91c-4ac2-aecf-0d8093edff37.png" width="300px">
<hr>

### Tech stack
* [Python](https://docs.python.org/3/)
    * [Pandas](https://pandas.pydata.org/)
    * [Numpy](https://numpy.org)
    * [pymysql](https://pypi.org/project/PyMySQL/)
    * [sqlalchemy](https://www.sqlalchemy.org)
* [FastAPI](https://fastapi.tiangolo.com/)
* [Uvicorn](https://www.uvicorn.org/)
* [MySQL](https://www.mysql.com/)
* [Docker](https://www.docker.com)
* [Mogenius](https://mogenius.com)

<hr>

## Workplan:
In the following video I explain the steps detailed below (in Spanish):

[<img src="https://user-images.githubusercontent.com/110403753/206619791-f63f171b-6736-4415-843e-f50f1e8de46f.png" width="200px">](https://youtu.be/ThbD2etUDbg)

1. EDA (Exploratory data analysis)
2. Relate datasets and join them
3. ETL (Extraction, Transform, Load)
4. Create an API with FastAPI
5. Create a Docker container with the API
6. Queries
7. Mogenius deployment _(extra step)_

### Repository archives
- [**Datasets**:](./Datasets/) Inside this folder are the raw files used to carry out the project, and also the file that was created as a result of ETL. 
- [**EDA_ETL**:](./EDA_ETL/) Here are the files used to perform the EDA and ETL.
- [**Dockerfile**:](./Dockerfile) Script to upload the Docker container.
- [**main.py**:](/main.py) Script to instance the API, with the functions to answer the queries.

## EDA <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width=40px height=40px/><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jupyter/jupyter-original-wordmark.svg" width=40px height=40px/><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pandas/pandas-original.svg" width=40px height=40px/>   
For the first step, the EDA was made with the PI_Script.ipynb file. The datasets were explored, dropping duplicate data, reviewing data types and missing data. Based on this analysis, some initial conclusions were drawn.

## Relate 
The datasets were related in a new Dataset, adding a Feature referring to the source table. Then, they were loaded into a MySQL database to perform some transformations.

## ETL <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original-wordmark.svg" width=50px height=50px/>  
Queries were made with the ETL_Script.sql, in order to adapt the type of the data. Some pertinent value transformations were done, taking into account which Features were required for the queries. Others that were not so relevant were left aside, because the focus of the work was not the ETL, but the following stages.

## Create an API with FastAPI <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" width=40px height=40px/>

For the creation of the API, the main.py file was used, where the functions for making queries were configured. The script locally instantiates the API, which loads the CSV already transformed to perform said queries, and returns the expected results.
To check the API queries, we raise the Uvicorn locally from the terminal with the command:
```uvicorn main:app --reload```

For this project, only 4 types of queries were requested
+ Longest running title, by platform and by year:
     The request must be: /get_max_duration(year, platform, [min o season])

+ Total movies and series, by platform:
     The request must be: /get_count_platform(platform)  
  
+ Genre with the most occurrences, and its platform:
     The request must be: get_listedin(genero)  

+ Actor with the most occurrences, by platform and by year:
     The request must be: get_actor(plataforma, año)

## Docker container <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-plain.svg" width=40px height=40px/>

To upload the container image, Dockerfile was used. This tells us that we are going to use a container that already includes the Python functions, with the necessary libraries to load the API. This is done with the Docker Desktop app for Windows, and with a few lines in the Visual Studio Code terminal.  
```docker build -t <image> .``` To create an image. An already existing image can be used too.   
```docker run -it -p 8000:8000 -v cd:/usr/src/app <image>``` Creates the container with said image. 

## Queries
Once the container is active, the docs URL is loaded to perform the queries, or also with the direct URL:
``localhost:8000/get_max_duration(2018,'Hulu','min')``
Upon reviewing that the queries deliver the expected results, the required steps are considered complete.

## Mogenius - extra step
To build the container with the API so that it can be consumed from anywhere, Mogenius was used. With all files on GitHub, permission is granted in Mogenius to be able to consume the API.

In the following link you can consult the Deployment in Mogenius:

[<img src="https://user-images.githubusercontent.com/110403753/206621156-690eebab-6b72-4b4e-b77a-0079e6da0791.png" width="200px">](https://pi01-api-docke-prod-pi-01-fernandezguille-brfrrr.mo5.mogenius.io/docs)

<hr>

## Conclusion
By carrying out this project, it was possible to integrate the concepts learned about Python, and to investigate new knowledge through research on API and Docker. There is also a lot of work to be done in SQL, which will be attempted over time.

Here is my contact info:  
<a href="https://www.linkedin.com/in/fernandezguillermo"><img alt="Linkedin" title="Connect with me" src="https://img.shields.io/badge/Linkedin-0077B5?style=flat&logo=linkedin&logoColor=white"></a>  

Thank you very much for reading all!