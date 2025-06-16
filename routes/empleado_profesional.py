from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import EmpleadoProfesional, FormacionProfesional, EmpleadoIdioma, Idioma, HistoricoEmpleado, EstructuraOrganizacional
from schemas.empleado_profesional import EmpleadoProfesionalCreate, EmpleadoProfesionalResponse, HistoricoEmpleadoCreate, EstructuraOrganizacionalResponse
from schemas.formacion_profesional import FormacionProfesionalCreate, FormacionProfesionalResponse

router = APIRouter()

@router.post("/", response_model=EmpleadoProfesionalResponse)
def create_empleado(empleado: EmpleadoProfesionalCreate, db: Session = Depends(get_db)):
    db_empleado = EmpleadoProfesional(
        primer_nombre=empleado.primer_nombre,
        primer_apellido=empleado.primer_apellido,
        segundo_apellido=empleado.segundo_apellido,
        fecha_nacimiento=empleado.fecha_nacimiento,
        doc_identidad=empleado.doc_identidad,
        dato_contacto=empleado.dato_contacto,
        segundo_nombre=empleado.segundo_nombre
    )
    
    try:
        db.add(db_empleado)
        db.flush()  # Para obtener el id_empleado_prof

        # Crear las formaciones profesionales
        if empleado.formaciones:
            for formacion in empleado.formaciones:
                db_formacion = FormacionProfesional(
                    id_empleado_prof=db_empleado.id_empleado_prof,
                    nombre_titulo=formacion.nombre_titulo,
                    ano=formacion.ano,
                    descripcion_especialidad=formacion.descripcion_especialidad
                )
                db.add(db_formacion)

        # Crear las relaciones con idiomas
        if empleado.idiomas:
            for id_idioma in empleado.idiomas:
                db_emp_idi = EmpleadoIdioma(
                    id_empleado_prof=db_empleado.id_empleado_prof,
                    id_idioma=id_idioma
                )
                db.add(db_emp_idi)

        # Crear el histórico del empleado
        hist = empleado.historico
        db_historico = HistoricoEmpleado(
            id_empleado=db_empleado.id_empleado_prof,
            id_museo=hist.id_museo,
            id_estructura_org=hist.id_estructura_org,
            fecha_inicio=hist.fecha_inicio,
            rol_empleado=hist.rol_empleado
        )
        db.add(db_historico)

        db.commit()
        db.refresh(db_empleado)
        return db_empleado
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/", response_model=List[EmpleadoProfesionalResponse])
def get_empleados(db: Session = Depends(get_db)):
    empleados = db.query(EmpleadoProfesional).all()
    return empleados

@router.get("/{id_empleado}", response_model=EmpleadoProfesionalResponse)
def get_empleado(id_empleado: int, db: Session = Depends(get_db)):
    empleado = db.query(EmpleadoProfesional).filter(EmpleadoProfesional.id_empleado_prof == id_empleado).first()
    if empleado is None:
        raise HTTPException(status_code=404, detail="Empleado no encontrado")
    return empleado

@router.put("/{id_empleado}", response_model=EmpleadoProfesionalResponse)
def update_empleado(id_empleado: int, empleado_update: EmpleadoProfesionalCreate, db: Session = Depends(get_db)):
    empleado = db.query(EmpleadoProfesional).filter(EmpleadoProfesional.id_empleado_prof == id_empleado).first()
    if empleado is None:
        raise HTTPException(status_code=404, detail="Empleado no encontrado")
    
    for key, value in empleado_update.dict(exclude={'formaciones', 'idiomas'}).items():
        setattr(empleado, key, value)
    
    try:
        # Actualizar formaciones
        if empleado_update.formaciones is not None:
            # Eliminar formaciones existentes
            db.query(FormacionProfesional).filter(
                FormacionProfesional.id_empleado_prof == id_empleado
            ).delete()

            # Crear nuevas formaciones
            for formacion in empleado_update.formaciones:
                db_formacion = FormacionProfesional(
                    id_empleado_prof=id_empleado,
                    nombre_titulo=formacion.nombre_titulo,
                    ano=formacion.ano,
                    descripcion_especialidad=formacion.descripcion_especialidad
                )
                db.add(db_formacion)

        # Actualizar idiomas
        if empleado_update.idiomas is not None:
            # Eliminar relaciones existentes
            db.query(EmpleadoIdioma).filter(
                EmpleadoIdioma.id_empleado_prof == id_empleado
            ).delete()

            # Crear nuevas relaciones
            for id_idioma in empleado_update.idiomas:
                db_emp_idi = EmpleadoIdioma(
                    id_empleado_prof=id_empleado,
                    id_idioma=id_idioma
                )
                db.add(db_emp_idi)

        db.commit()
        db.refresh(empleado)
        return empleado
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.delete("/{id_empleado}")
def delete_empleado(id_empleado: int, db: Session = Depends(get_db)):
    empleado = db.query(EmpleadoProfesional).filter(EmpleadoProfesional.id_empleado_prof == id_empleado).first()
    if empleado is None:
        raise HTTPException(status_code=404, detail="Empleado no encontrado")
    
    try:
        db.delete(empleado)
        db.commit()
        return {"message": "Empleado eliminado exitosamente"}
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/historicos-empleado-detalle/{id_museo}/{id_estructura_org}", response_model=List[dict])
def get_historicos_empleado_detalle(id_museo: int, id_estructura_org: int, db: Session = Depends(get_db)):
    historicos = (
        db.query(HistoricoEmpleado, EmpleadoProfesional)
        .join(EmpleadoProfesional, EmpleadoProfesional.id_empleado_prof == HistoricoEmpleado.id_empleado)
        .filter(
            HistoricoEmpleado.id_museo == id_museo,
            HistoricoEmpleado.id_estructura_org == id_estructura_org,
            HistoricoEmpleado.fecha_fin == None
        )
        .all()
    )
    # Solo devolver un registro por empleado+fecha_inicio (el histórico activo en esa estructura)
    resultado = []
    empleados_vistos = set()
    for h in historicos:
        key = (h.HistoricoEmpleado.id_empleado, h.HistoricoEmpleado.fecha_inicio)
        if key not in empleados_vistos:
            empleados_vistos.add(key)
            resultado.append({
                "id_empleado": h.HistoricoEmpleado.id_empleado,
                "primer_nombre": h.EmpleadoProfesional.primer_nombre,
                "primer_apellido": h.EmpleadoProfesional.primer_apellido,
                "fecha_inicio": h.HistoricoEmpleado.fecha_inicio
            })
    return resultado

@router.get("/empleados-profesionales/{id_museo}/{id_estructura_org}", response_model=List[dict])
def get_empleados_profesionales(id_museo: int, id_estructura_org: int, db: Session = Depends(get_db)):
    empleados = (
        db.query(EmpleadoProfesional)
        .join(HistoricoEmpleado, EmpleadoProfesional.id_empleado_prof == HistoricoEmpleado.id_empleado)
        .filter(
            HistoricoEmpleado.id_museo == id_museo,
            HistoricoEmpleado.id_estructura_org == id_estructura_org
        )
        .all()
    )
    return [e.__dict__ for e in empleados]

@router.get("/estructuras/{id_museo}", response_model=List[EstructuraOrganizacionalResponse])
def get_estructuras_por_museo(id_museo: int, db: Session = Depends(get_db)):
    estructuras = db.query(EstructuraOrganizacional).filter(EstructuraOrganizacional.id_museo == id_museo).all()
    return estructuras

@router.get("/historicos-empleado/{id_museo}/{id_estructura_org}", response_model=List[dict])
def get_historicos_empleado(id_museo: int, id_estructura_org: int, db: Session = Depends(get_db)):
    historicos = db.query(HistoricoEmpleado).filter(
        HistoricoEmpleado.id_museo == id_museo,
        HistoricoEmpleado.id_estructura_org == id_estructura_org
    ).all()
    return [h.__dict__ for h in historicos] 