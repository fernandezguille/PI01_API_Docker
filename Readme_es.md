<h1 align=center> PROYECTO INDIVIDUAL 01 </h1>
<h2 align=center> EDA-ETL-FastAPI-Docker en Datasets de plataformas de Streaming </h2>

<br>

¡Hola! Mi nombre es *Guillermo Fernández* y éste mi primer proyecto individual, que forma parte de la formación práctica del bootcamp de Data Science de la academia Henry. 

<hr>

## Objetivo
Realizar una ingesta de datos desde diversas fuentes, aplicar las transformaciones que se consideren pertinentes, y luego disponibilizar los datos limpios para su consulta a través de una API en un entorno virtual dockerizado.

[Consigna completa del PI](https://github.com/HX-FAshur/PI01_DATA05)

### Contexto
La cantidad de contenidos disponibles hoy en las plataformas está en permanente crecimiento. Para este trabajo, se utilizaron datasets de las plataformas Amazon, Disney, Hulu y Netflix.

<img src="https://user-images.githubusercontent.com/110403753/209761096-8cfd888f-62a3-4de9-83ac-605f4ce0a025.png" width="200px">
<img src="https://user-images.githubusercontent.com/110403753/209761412-26b311f6-6847-48b6-8c97-6dd020e93372.png" width="200px">
<img src="https://user-images.githubusercontent.com/110403753/209761331-68019653-f285-4d73-b225-2280dbb69e83.png" width="200px">
<img src="https://user-images.githubusercontent.com/110403753/209761759-d7701724-a91c-4ac2-aecf-0d8093edff37.png" width="300px">
<hr>

### Tecnologías utilizadas
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

## Plan de trabajo:
En el siguiente video explico los pasos detallados a continuación:

[<img src="https://user-images.githubusercontent.com/110403753/206619791-f63f171b-6736-4415-843e-f50f1e8de46f.png" width="200px">](https://youtu.be/ThbD2etUDbg)

1. EDA (Exploratory data analysis)
2. Relacionar datasets y crear tabla conjunta
3. ETL (Extraction, Transform, Load)
4. Crear una API con FastAPI
5. Crear un entorno en Docker que contenga la API
6. Realizar las consultas
7. Realizar un deployment en Mogenius _(paso extra)_

### Archivos del repositorio
- [**Datasets**:](./Datasets/) En esta carpeta se encuentran los archivos raw utilizados para realizar el proyecto, y también el archivo que se creó con los resultados del ETL.  
- [**EDA_ETL**:](./EDA_ETL/) Aquí están los archivos utilizados para realizar el EDA y ETL.
- [**Dockerfile**:](./Dockerfile) Script para levantar la imagen del contenedor en Docker.
- [**main.py**:](/main.py) Script para instanciar la API, con las funciones de consultas.

## EDA <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width=40px height=40px/><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jupyter/jupyter-original-wordmark.svg" width=40px height=40px/><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/pandas/pandas-original.svg" width=40px height=40px/>   
Para el primer paso, se realizó el EDA con el archivo PI_Script.ipynb. Se exploraron los datasets, eliminando datos duplicados, revisando tipos de datos y faltantes. En base a este análisis, se obtuvieron algunas conclusiones iniciales.

## Relacionar 
Se relacionaron los datasets en un nuevo Dataset, agregando un Feature haciendo referencia a la tabla de origen. Luego, se cargaron a una base de datos en MySQL para realizar algunas transformaciones.

## ETL <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original-wordmark.svg" width=50px height=50px/>  
Con el ETL_Script.sql se realizaron diversas consultas, para poder adecuar el tipo de los datos. Se realizaron algunas transformaciones de valores pertinentes, teniendo en cuenta cuáles eran los Features necesarios para las consultas. Se dejaron de lado otras que eran menos importantes, y que no eran tan relevantes, debido a que el foco del trabajo no era el ETL, sino las siguientes etapas.

## Crear una API con FastAPI <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/fastapi/fastapi-original.svg" width=40px height=40px/>

Para la creación de la API, se utilizó el archivo main.py, en donde se configuraron las funciones para la realización de consultas. El script instancia de manera local la API, que carga el CSV ya transformado para realizar dichas consultas, y devuelve los resultados esperados.  
Para revisar las consultas en la API, levantamos el Uvicorn de manera local desde la terminal con el comando:  
```uvicorn main:app --reload```

Para este proyecto, se solicitaban únicamente 4 tipos de consultas
+ Título de más duración, por plataforma y por año:  
    El request debe ser: /get_max_duration(año, plataforma, [min o season])

+ Total de películas y series, por plataforma:  
    El request debe ser: /get_count_plataform(plataforma)  
  
+ Género con mayor ocurrencias, y su plataforma:  
    El request debe ser: get_listedin(genero)  

+ Actor con mayor ocurrencias, por plataforma y por año:  
    El request debe ser: get_actor(plataforma, año)

## Entorno Docker <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-plain.svg" width=40px height=40px/>

Para levantar la imagen del contenedor, se utilizó Dockerfile. Este nos indica que vamos a utilizar un contenedor que ya trae las funciones de Python, con las librerías necesarias para cargar la API. Esto se realiza con la aplicación Docker Desktop para Windows, y con algunas líneas en la terminal del Visual Studio Code.  
```docker build -t <image> .``` Crea una imagen de nuestra api, o es posible utilizar una ya creada desde internet  
```docker run -it -p 8000:8000 -v cd:/usr/src/app <image>``` Crea el contenedor con la imagen declarada  

## Consultas
Una vez que ya está activo el contenedor, se carga la URL docs para realizar las consultas, o también con la URL directa:  
``localhost:8000/get_max_duration(2018,'Hulu','min')``  
Al revisar que las consultas entregan los resultados esperados, se dan por finalizadas las consignas requeridas.

## Mogenius - Paso extra
Para levantar el contenedor con la API y que se pueda consumir desde cualquier sitio, se utilizó Mogenius. Con todo los archivos en GitHub, se otorga el permiso en Mogenius para poder consumir la API.  

En el siguiente link pueden consultar el Deployment en Mogenius:

[<img src="https://user-images.githubusercontent.com/110403753/206621156-690eebab-6b72-4b4e-b77a-0079e6da0791.png" width="200px">](https://pi01-api-docke-prod-pi-01-fernandezguille-brfrrr.mo5.mogenius.io/docs)

<hr>

## Conclusión
Al realizar este proyecto, se logró integrar los conceptos aprendidos sobre Python, e investigar sobre nuevos conocimientos a través de investigación sobre API y Docker. También hay mucho trabajo por realizar en SQL, que se intentará lograr con el paso del tiempo.

Les dejo mi contacto:  
<a href="https://www.linkedin.com/in/fernandezguillermo"><img alt="Linkedin" title="Connect with me" src="https://img.shields.io/badge/Linkedin-0077B5?style=flat&logo=linkedin&logoColor=white"></a>  

¡Muchas gracias por llegar hasta aquí!