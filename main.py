from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from database import engine, Base
from routes.lugares import router as lugares_router

# Crear la aplicación FastAPI
app = FastAPI(title="Museos API")

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # URL del frontend de Vite
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Crear las tablas
Base.metadata.create_all(bind=engine)

# Incluir los routers
app.include_router(lugares_router, prefix="/lugares", tags=["lugares"]) 