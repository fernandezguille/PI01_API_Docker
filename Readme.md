# PROYECTO INDIVIDUAL 01

_URL del video aquí_

El proyecto consiste en realizar una ingesta de datos desde diversas fuentes, posteriormente aplicar las transformaciones que consideren pertinentes, y luego disponibilizar los datos limpios para su consulta a través de una API. Esta API deberán construirla en un entorno virtual dockerizado.

[Consigna completa del PI](https://github.com/HX-FAshur/PI01_DATA05)

## Los pasos para realizar el proyecto son:
1. EDA (Exploratory data analysis)
2. Relacionar datasets y crear tabla conjunta
3. ETL (Extraction, Transform, Load)
4. Crear una API con FastAPI
5. Crear un entorno en Docker que contenga la API
6. Realizar las consultas

_Los archivos para realizar el proyecto se encuentran dentro de la carpeta Datasets._

#### EDA
Para el primer paso, se realizó el EDA con el archivo PI_Script.ipynb. Se exploraron los datasets, eliminando duplicados, y revisando tipos de datos

#### Relacionar
Se relacionaron los datasets en un nuevo Dataset, agregando un Feature haciendo referencia a la tabla de origen. Luego, se cargaron a una base de datos en MySQL.

#### ETL
Con el ETL_Script se realizaron diversas consultas, para poder adecuar el tipo de los datos. También se realizaron las transformaciones de valores pertinentes.

#### Crear una API con FastAPI
Dentro de la carpeta FastAPI, se encuentra el archivo main.py, con el cual se levantó la API de manera local, y se configuraron las funciones para la realización de consultas. La API se conecta a la base de datos de MySQL para realizar las Querys, y devuelve los resultados esperados.

#### Entorno Docker
