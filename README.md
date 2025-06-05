# Sistema de Gestión de Museos

Este sistema permite la gestión integral de museos, incluyendo la administración de empleados, idiomas y otros aspectos relacionados con la operación museística.

## Requisitos Previos

- Node.js (v14.0.0 o superior)
- Python (v3.8 o superior)
- PostgreSQL (v12.0 o superior)

## Instalación y Configuración

### Backend (Python/FastAPI)

1. Navega al directorio del backend:
```bash
cd backend
```

2. Crea un entorno virtual:
```bash
python -m venv venv
```

3. Activa el entorno virtual:
- En Windows:
```bash
.\venv\Scripts\activate
```
- En Linux/MacOS:
```bash
source venv/bin/activate
```

4. Instala las dependencias:
```bash
pip install -r requirements.txt
```

5. Configura la base de datos PostgreSQL:
- Crea una base de datos llamada `museos`
- Actualiza las credenciales de la base de datos en el archivo `config.py`

6. Ejecuta el servidor:
```bash
uvicorn main:app --reload
```

El backend estará disponible en `http://localhost:8000`

### Frontend (React/TypeScript)

1. Navega al directorio del frontend:
```bash
cd frontend
```

2. Instala las dependencias:
```bash
npm install
```

3. Inicia el servidor de desarrollo:
```bash
npm run dev
```

El frontend estará disponible en `http://localhost:5173`

## Estructura del Proyecto

```
museos/
├── backend/           # Servidor FastAPI
│   ├── models/       # Modelos de la base de datos
│   ├── routes/       # Rutas de la API
│   └── config.py     # Configuración
└── frontend/         # Cliente React
    ├── src/
    │   ├── components/   # Componentes React
    │   ├── pages/       # Páginas de la aplicación
    │   └── types/       # Tipos TypeScript
    └── public/          # Archivos estáticos
```

## Módulos Principales

- **Gestión de Empleados**: Administración del personal del museo
- **Gestión de Idiomas**: Control de idiomas hablados por el personal
- **Interfaz de Usuario**: Diseño moderno con tema museístico

## Tema y Estilos

El sistema utiliza una paleta de colores específica para museos:
- `#2C3639`: Color principal
- `#3F4E4F`: Color secundario
- `#A27B5C`: Acento
- `#DCD7C9`: Fondo/Contraste

## Soporte

Para reportar problemas o solicitar nuevas características, por favor crear un issue en el repositorio. 