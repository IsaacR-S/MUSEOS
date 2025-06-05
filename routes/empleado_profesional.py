from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from models.database_models import EmpleadoProfesional, FormacionProfesional
from schemas.empleado_profesional import EmpleadoProfesionalCreate, EmpleadoProfesionalResponse
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
    
    for key, value in empleado_update.dict(exclude={'formaciones'}).items():
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