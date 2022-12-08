from fastapi import FastAPI
import pandas as pd

app = FastAPI()

# Cargamos la base de datos al iniciar Uvicorn
@app.on_event('startup')
def startup():
    global DF
    DF = pd.read_csv('All_titles.csv')

@app.get('/')
async def index():
    return {'PI01 para Henry de Guillermo Fernández'}

@app.get('/about')
async def about():
    return 'API creada por Guillermo Fernández con FastAPI y uvicorn'


# URL para realizar la consulta http://127.0.0.1:8000/get_max_duration(2018,'Hulu','min')
@app.get('/get_max_duration({year},{platform},{tipo})')
async def get_max_duration(
                            year:int,
                            platform:str,
                            tipo:str):
    platform = platform.replace("'","")
    platform = platform.capitalize()
    tipo = tipo.replace("'","")
    tipo = tipo.lower()
    if tipo == 'min': tipo = 'Movie'
    elif tipo == 'season': tipo = 'TV Show'
    Max_duration = DF[(DF.Platform == platform) & (DF.Release_year == year) & ((DF.Type == tipo) )]
    return DF.loc[Max_duration.Duration.idxmax()].Title


# URL para realizar la consulta http://127.0.0.1:8000/get_count_plataform('Netflix')
@app.get('/get_count_plataform({platform})')
async def get_count_plataform(platform:str):
    platform = platform.replace("'","")
    platform = platform.capitalize()
    Count_platform = DF[(DF.Platform == platform)]
    movies = int(Count_platform[Count_platform.Type == 'Movie'].Type.value_counts()[0])
    series = int(Count_platform[Count_platform.Type == 'TV Show'].Type.value_counts()[0])
    return platform, f'Movie: {movies}', f'TV Show: {series}'


# URL para realizar la consulta http://127.0.0.1:8000/get_listedin('Comedy')
@app.get('/get_listedin({genre})')
async def get_listedin(genre:str):
    genre = genre.replace("'","")
    genre = genre.capitalize()
    Plataformas, apariciones = list(DF.Platform.unique()), list()
    for elem in Plataformas:
        DF_por_plataforma = DF[(DF.Platform == elem)]
        DF_por_plataforma['Ind'] = DF_por_plataforma.Listed_in.str.find(genre)
        apariciones.append(DF_por_plataforma[DF_por_plataforma.Ind != -1].Ind.shape[0])
    return max(apariciones), Plataformas[apariciones.index(max(apariciones))]


# URL para realizar la consulta http://127.0.0.1:8000/get_actor('Netflix',2018)
@app.get('/get_actor({platform},{year})')
async def get_actor(
                    platform:str,
                    year:int):
    platform = platform.replace("'","")
    platform = platform.capitalize()
    actores, repeticiones = list(), list()
    Cast_list = list(DF[(DF.Platform == platform) & (DF.Release_year == year)].Cast.fillna('Sin_datos'))

    for each in Cast_list:
        if not(each == 'Sin_datos' or each is None):
            lista = each.split(",")
            for elem in lista:
                elem = elem.strip()
                if elem in actores:
                    repeticiones[actores.index(elem)] += 1
                else:    
                    actores.append(elem)
                    repeticiones.append(1)
    if actores == []: return 'No hay datos'
    return (platform, max(repeticiones), actores[repeticiones.index(max(repeticiones))])