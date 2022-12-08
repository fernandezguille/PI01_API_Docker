# __PROYECTO INDIVIDUAL 01__

### Introducción

Éste el el primer proyecto individual, que forma parte de la formación práctica del bootcamp de Data Science de Henry. El mismo consiste en realizar una ingesta de datos desde diversas fuentes, aplicar las transformaciones que se consideren pertinentes, y luego disponibilizar los datos limpios para su consulta a través de una API. Esta API se debe construir en un entorno virtual dockerizado.

[Consigna completa del PI](https://github.com/HX-FAshur/PI01_DATA05)

En el siguiente video explico los pasos detallados a continuación:

_URL del video aquí_

## Pasos para realizar el proyecto:
1. EDA (Exploratory data analysis)
2. Relacionar datasets y crear tabla conjunta
3. ETL (Extraction, Transform, Load)
4. Crear una API con FastAPI
5. Crear un entorno en Docker que contenga la API
6. Realizar las consultas
7. Realizar un deployment en Mogenius _(paso extra)_

## Archivos del repositorio
Los archivos raw utilizados para realizar el proyecto se encuentran dentro de la carpeta Datasets, y también el archivo que se creó con los resultados del ETL.  
Dockerfile y main.py son los archivos que se utilizaron para cargar el Contenedor y la API.
Para realizar EDA y ETL utilizamos los archivos que se encuentran en la carpeta que lleva ese nombre, ETL_Script.sql y PI_Script.ipynb.

## EDA
Para el primer paso, se realizó el EDA con el archivo PI_Script.ipynb. Se exploraron los datasets, eliminando datos duplicados, revisando tipos de datos y faltantes. En base a este análisis, se obtuvieron algunas conclusiones iniciales.

## Relacionar
Se relacionaron los datasets en un nuevo Dataset, agregando un Feature haciendo referencia a la tabla de origen. Luego, se cargaron a una base de datos en MySQL para realizar algunas transformaciones.

## ETL
Con el ETL_Script.sql se realizaron diversas consultas, para poder adecuar el tipo de los datos. Se realizaron algunas transformaciones de valores pertinentes, teniendo en cuenta cuáles eran los Features necesarios para las consultas. Se dejaron de lado algunas transformaciones que eran menos importantes, y que no eran tan relevantes, debido a que el foco del trabajo no es el ETL, sino las siguientes etapas.

## Crear una API con FastAPI
Para la creación de la API, se utilizó el archivo main.py. Con eso se levantó la API de manera local, y se configuraron las funciones para la realización de consultas. La API carga el CSV ya transformado para realizar las consultas, y devuelve los resultados esperados.  

Para este proyecto, se solicitaban únicamente 4 tipos de consultas
+ Título de más duración, por plataforma y por año:  
    El request debe ser: /get_max_duration(año, plataforma, [min o season])

+ Total de películas y series, por plataforma:  
    El request debe ser: /get_count_plataform(plataforma)  
  
+ Género con mayor ocurrencias, y su plataforma:  
    El request debe ser: get_listedin(genero)  

+ Actor con mayor ocurrencias, por plataforma y por año:  
    El request debe ser: get_actor(plataforma, año)

## Entorno Docker
Para la creación del contenedor, se utilizó Dockerfile. Este nos indica que vamos a utilizar un contenedor que ya trae las funciones de Python, con las librerías necesarias para cargar la API. Esto se realiza con la aplicación Docker Desktop para Windows, y con algunas líneas en la terminal del Visual Studio Code.

## Consultas
Una vez que ya está activo el contenedor, se carga la URL docs para realizar las consultas, o también con la URL directa:  
localhost:8000/get_max_duration(2018,'Hulu','min')  
Al revisar que las consultas entregan los resultados esperados, se dan por finalizadas las consignas requeridas.

## Mogenius - Paso extra
Para levantar el contenedor con la API y que se pueda consumir desde cualquier sitio, se utilizó Mogenius. Con todo los archivos en GitHub, se otorga el permiso en Mogenius para poder consumir la API.  

[Link a FastAPI](https://pi01-api-docke-prod-pi-01-fernandezguille-brfrrr.mo5.mogenius.io/docs)

¡Muchas gracias por llegar hasta aquí!