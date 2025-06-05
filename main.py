from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes.museo import router as museo_router
from routes.lugar import router as lugar_router
from routes.resumen_hist import router as resumen_hist_router
from routes.empleado_profesional import router as empleado_profesional_router
from routes.obra import router as obra_router
from routes import empleado_profesional, idioma
from database import init_db

# Crear la aplicación FastAPI
app = FastAPI(title="Museos API")

# Initialize database
init_db()

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Incluir los routers
app.include_router(museo_router, prefix="/museos", tags=["museos"])
app.include_router(lugar_router, prefix="/lugares", tags=["lugares"])
app.include_router(resumen_hist_router, prefix="/resumenes-historicos", tags=["resumenes-historicos"])
app.include_router(empleado_profesional_router, prefix="/empleados-profesionales", tags=["empleados-profesionales"])
app.include_router(obra_router, prefix="/obras", tags=["obras"])
app.include_router(empleado_profesional.router, prefix="/empleados-profesionales", tags=["empleados"])
app.include_router(idioma.router, prefix="/idiomas", tags=["idiomas"])

@app.get("/")
def read_root():
    return {"message": "Bienvenido al Sistema de Gestión de Museos"} 