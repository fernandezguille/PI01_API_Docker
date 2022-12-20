from fastapi import FastAPI
from router.router import user

app = FastAPI(title= "API to consult Streaming platforms data",
    description= "Amazon, Disney, Hulu and Netflix",   
)

app.include_router(user)