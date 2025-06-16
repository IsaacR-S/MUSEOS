import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { EmpleadoProfesional, FormacionProfesional, Idioma, EstructuraOrganizacional, HistoricoEmpleadoForm } from '../types/empleado_profesional';
import type { Museo } from '../types/museo';

interface Props {
  empleado: EmpleadoProfesional | null;
  onCancel: () => void;
  onSuccess: () => void;
}

const EmpleadoProfesionalForm: React.FC<Props> = ({ empleado, onCancel, onSuccess }) => {
  const [formData, setFormData] = useState({
    primer_nombre: '',
    segundo_nombre: '',
    primer_apellido: '',
    segundo_apellido: '',
    fecha_nacimiento: '',
    doc_identidad: '',
    dato_contacto: '',
    formaciones: [] as FormacionProfesional[],
    idiomas: [] as number[]
  });
  const [loading, setLoading] = useState(false);
  const [idiomas, setIdiomas] = useState<Idioma[]>([]);
  const [showFormaciones, setShowFormaciones] = useState(false);
  const [showIdiomas, setShowIdiomas] = useState(false);
  const [nuevoIdioma, setNuevoIdioma] = useState('');
  const [agregandoIdioma, setAgregandoIdioma] = useState(false);
  const [museos, setMuseos] = useState<Museo[]>([]);
  const [estructuras, setEstructuras] = useState<EstructuraOrganizacional[]>([]);
  const [historico, setHistorico] = useState<HistoricoEmpleadoForm>({
    id_museo: 0,
    id_estructura_org: 0,
    fecha_inicio: '',
    rol_empleado: ''
  });

  useEffect(() => {
    fetchIdiomas();
  }, []);

  useEffect(() => {
    if (empleado) {
      setFormData({
        primer_nombre: empleado.primer_nombre,
        segundo_nombre: empleado.segundo_nombre || '',
        primer_apellido: empleado.primer_apellido,
        segundo_apellido: empleado.segundo_apellido,
        fecha_nacimiento: empleado.fecha_nacimiento.split('T')[0],
        doc_identidad: empleado.doc_identidad.toString(),
        dato_contacto: empleado.dato_contacto || '',
        formaciones: empleado.formaciones?.map(f => ({
          ...f,
          ano: new Date(f.ano).toISOString().split('T')[0]
        })) || [],
        idiomas: empleado.idiomas?.map(i => i.id_idioma) || []
      });
    } else {
      setFormData({
        primer_nombre: '',
        segundo_nombre: '',
        primer_apellido: '',
        segundo_apellido: '',
        fecha_nacimiento: '',
        doc_identidad: '',
        dato_contacto: '',
        formaciones: [],
        idiomas: []
      });
    }
  }, [empleado]);

  useEffect(() => {
    fetchMuseos();
  }, []);

  const fetchMuseos = async () => {
    try {
      const response = await fetch('http://localhost:8000/museos/');
      if (!response.ok) throw new Error('Error al cargar museos');
      const data = await response.json();
      setMuseos(data);
    } catch (error) {
      toast.error('Error al cargar museos');
    }
  };

  const fetchEstructuras = async (idMuseo: number) => {
    try {
      const response = await fetch(`http://localhost:8000/empleados-profesionales/estructuras/${idMuseo}`);
      if (!response.ok) throw new Error('Error al cargar estructuras organizacionales');
      const data = await response.json();
      setEstructuras(data);
    } catch (error) {
      toast.error('Error al cargar estructuras organizacionales');
    }
  };

  useEffect(() => {
    if (historico.id_museo) {
      fetchEstructuras(historico.id_museo);
      setHistorico(h => ({ ...h, id_estructura_org: 0 }));
    }
  }, [historico.id_museo]);

  const fetchIdiomas = async () => {
    try {
      const response = await fetch('http://localhost:8000/idiomas/');
      if (!response.ok) {
        throw new Error('Error al cargar los idiomas');
      }
      const data = await response.json();
      setIdiomas(data);
    } catch (error) {
      toast.error('Error al cargar los idiomas');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      const url = empleado?.id_empleado_prof
        ? `http://localhost:8000/empleados-profesionales/${empleado.id_empleado_prof}`
        : 'http://localhost:8000/empleados-profesionales/';
      const body = {
        ...formData,
        doc_identidad: parseInt(formData.doc_identidad),
        formaciones: formData.formaciones.map(f => ({ ...f, ano: f.ano })),
        idiomas: formData.idiomas,
        historico: historico
      };
      const response = await fetch(url, {
        method: empleado ? 'PUT' : 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al guardar el empleado');
      }

      toast.success(
        empleado
          ? 'Empleado actualizado exitosamente'
          : 'Empleado creado exitosamente'
      );
      
      setFormData({
        primer_nombre: '',
        segundo_nombre: '',
        primer_apellido: '',
        segundo_apellido: '',
        fecha_nacimiento: '',
        doc_identidad: '',
        dato_contacto: '',
        formaciones: [],
        idiomas: []
      });
      setHistorico({ id_museo: 0, id_estructura_org: 0, fecha_inicio: '', rol_empleado: '' });
      onSuccess();
      onCancel();
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Error al guardar el empleado');
    } finally {
      setLoading(false);
    }
  };

  const handleAddFormacion = () => {
    setFormData(prev => ({
      ...prev,
      formaciones: [
        ...prev.formaciones,
        { nombre_titulo: '', ano: '', descripcion_especialidad: '' }
      ]
    }));
  };

  const handleRemoveFormacion = (index: number) => {
    setFormData(prev => ({
      ...prev,
      formaciones: prev.formaciones.filter((_, i) => i !== index)
    }));
  };

  const handleFormacionChange = (index: number, field: keyof FormacionProfesional, value: string) => {
    setFormData(prev => ({
      ...prev,
      formaciones: prev.formaciones.map((f, i) => 
        i === index ? { ...f, [field]: value } : f
      )
    }));
  };

  const handleIdiomaChange = (idiomaId: number) => {
    setFormData(prev => ({
      ...prev,
      idiomas: prev.idiomas.includes(idiomaId)
        ? prev.idiomas.filter(id => id !== idiomaId)
        : [...prev.idiomas, idiomaId]
    }));
  };

  const handleAgregarIdioma = async () => {
    if (!nuevoIdioma.trim()) return;
    try {
      const response = await fetch('http://localhost:8000/idiomas/', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ nombre: nuevoIdioma.trim() })
      });
      if (!response.ok) throw new Error('Error al agregar idioma');
      const idiomaCreado = await response.json();
      setIdiomas(prev => [...prev, idiomaCreado]);
      setFormData(prev => ({ ...prev, idiomas: [...prev.idiomas, idiomaCreado.id_idioma] }));
      setNuevoIdioma('');
      setAgregandoIdioma(false);
      toast.success('Idioma agregado');
    } catch (error) {
      toast.error('No se pudo agregar el idioma');
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
        <div>
          <label htmlFor="primer_nombre" className="block text-sm font-medium text-[#2C3639]">
            Primer Nombre *
          </label>
          <input
            type="text"
            id="primer_nombre"
            value={formData.primer_nombre}
            onChange={(e) => setFormData({ ...formData, primer_nombre: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="segundo_nombre" className="block text-sm font-medium text-[#2C3639]">
            Segundo Nombre
          </label>
          <input
            type="text"
            id="segundo_nombre"
            value={formData.segundo_nombre}
            onChange={(e) => setFormData({ ...formData, segundo_nombre: e.target.value })}
            className="museum-input w-full"
          />
        </div>

        <div>
          <label htmlFor="primer_apellido" className="block text-sm font-medium text-[#2C3639]">
            Primer Apellido *
          </label>
          <input
            type="text"
            id="primer_apellido"
            value={formData.primer_apellido}
            onChange={(e) => setFormData({ ...formData, primer_apellido: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="segundo_apellido" className="block text-sm font-medium text-[#2C3639]">
            Segundo Apellido *
          </label>
          <input
            type="text"
            id="segundo_apellido"
            value={formData.segundo_apellido}
            onChange={(e) => setFormData({ ...formData, segundo_apellido: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="fecha_nacimiento" className="block text-sm font-medium text-[#2C3639]">
            Fecha de Nacimiento *
          </label>
          <input
            type="date"
            id="fecha_nacimiento"
            value={formData.fecha_nacimiento}
            onChange={(e) => setFormData({ ...formData, fecha_nacimiento: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="doc_identidad" className="block text-sm font-medium text-[#2C3639]">
            Documento de Identidad *
          </label>
          <input
            type="number"
            id="doc_identidad"
            value={formData.doc_identidad}
            onChange={(e) => setFormData({ ...formData, doc_identidad: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div className="sm:col-span-2">
          <label htmlFor="dato_contacto" className="block text-sm font-medium text-[#2C3639]">
            Datos de Contacto
          </label>
          <input
            type="text"
            id="dato_contacto"
            value={formData.dato_contacto}
            onChange={(e) => setFormData({ ...formData, dato_contacto: e.target.value })}
            className="museum-input w-full"
            placeholder="Teléfono, correo electrónico, etc."
          />
        </div>

        <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
          <div>
            <label className="block text-sm font-medium text-[#2C3639]">Museo *</label>
            <select
              className="museum-input w-full"
              value={historico.id_museo}
              onChange={e => setHistorico(h => ({ ...h, id_museo: Number(e.target.value) }))}
              required
            >
              <option value={0}>Seleccione un museo</option>
              {museos.map(m => (
                <option key={m.id_museo} value={m.id_museo}>{m.nombre}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-[#2C3639]">Estructura Organizacional *</label>
            <select
              className="museum-input w-full"
              value={historico.id_estructura_org}
              onChange={e => setHistorico(h => ({ ...h, id_estructura_org: Number(e.target.value) }))}
              required
              disabled={!historico.id_museo}
            >
              <option value={0}>Seleccione una estructura</option>
              {estructuras.map(e => (
                <option key={e.id_estructura_org} value={e.id_estructura_org}>{e.nombre} ({e.nivel} - {e.tipo})</option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-[#2C3639]">Rol *</label>
            <select
              className="museum-input w-full"
              value={historico.rol_empleado}
              onChange={e => setHistorico(h => ({ ...h, rol_empleado: e.target.value }))}
              required
            >
              <option value="">Seleccione un rol</option>
              <option value="curador">Curador</option>
              <option value="restaurador">Restaurador</option>
              <option value="administrativo">Administrativo</option>
              <option value="director">Director</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-[#2C3639]">Fecha de Inicio *</label>
            <input
              type="date"
              className="museum-input w-full"
              value={historico.fecha_inicio}
              onChange={e => setHistorico(h => ({ ...h, fecha_inicio: e.target.value }))}
              required
          />
        </div>
      </div>

      <div className="mt-6">
        <div className="flex justify-between items-center mb-4">
          <button
            type="button"
            onClick={() => setShowFormaciones(!showFormaciones)}
            className="text-lg font-medium text-[#2C3639] flex items-center"
          >
            <span className="mr-2">{showFormaciones ? '▼' : '▶'}</span>
            Formación Profesional
          </button>
          {showFormaciones && (
            <button
              type="button"
              onClick={handleAddFormacion}
              className="museum-button bg-[#A27B5C] text-white px-4 py-2 text-sm"
            >
              Agregar Formación
            </button>
          )}
        </div>

        {showFormaciones && (
          <div className="space-y-4">
            {formData.formaciones.map((formacion, index) => (
              <div key={index} className="bg-[#DCD7C9] p-4 rounded-lg">
                <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
                  <div>
                    <label className="block text-sm font-medium text-[#2C3639]">
                      Nombre del Título *
                    </label>
                    <input
                      type="text"
                      value={formacion.nombre_titulo}
                      onChange={(e) => handleFormacionChange(index, 'nombre_titulo', e.target.value)}
                      className="museum-input w-full"
                      required
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-[#2C3639]">
                      Año *
                    </label>
                    <input
                      type="date"
                      value={formacion.ano}
                      onChange={(e) => handleFormacionChange(index, 'ano', e.target.value)}
                      className="museum-input w-full"
                      required
                    />
                  </div>

                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-[#2C3639]">
                      Descripción de la Especialidad *
                    </label>
                    <input
                      type="text"
                      value={formacion.descripcion_especialidad}
                      onChange={(e) => handleFormacionChange(index, 'descripcion_especialidad', e.target.value)}
                      className="museum-input w-full"
                      required
                    />
                  </div>
                </div>

                <div className="mt-4 flex justify-end">
                  <button
                    type="button"
                    onClick={() => handleRemoveFormacion(index)}
                    className="text-red-600 hover:text-red-800"
                  >
                    Eliminar
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      <div className="mt-6">
        <div className="flex justify-between items-center mb-4">
          <button
            type="button"
            onClick={() => setShowIdiomas(!showIdiomas)}
            className="text-lg font-medium text-[#2C3639] flex items-center"
          >
            <span className="mr-2">{showIdiomas ? '▼' : '▶'}</span>
            Idiomas
          </button>
        </div>

        {showIdiomas && (
          <div className="bg-[#DCD7C9] p-4 rounded-lg">
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
              {idiomas.map((idioma) => (
                <label key={idioma.id_idioma} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    checked={formData.idiomas.includes(idioma.id_idioma)}
                    onChange={() => handleIdiomaChange(idioma.id_idioma)}
                    className="form-checkbox h-5 w-5 text-[#A27B5C]"
                  />
                  <span className="text-[#2C3639]">{idioma.nombre}</span>
                </label>
              ))}
            </div>
              <div className="mt-4">
                {agregandoIdioma ? (
                  <div className="flex items-center gap-2">
                    <input
                      type="text"
                      value={nuevoIdioma}
                      onChange={e => setNuevoIdioma(e.target.value)}
                      className="museum-input"
                      placeholder="Nuevo idioma"
                    />
                    <button type="button" className="museum-button" onClick={handleAgregarIdioma}>Guardar</button>
                    <button type="button" className="museum-button bg-[#3F4E4F]" onClick={() => { setAgregandoIdioma(false); setNuevoIdioma(''); }}>Cancelar</button>
                  </div>
                ) : (
                  <button type="button" className="museum-button" onClick={() => setAgregandoIdioma(true)}>
                    + Agregar nuevo idioma
                  </button>
                )}
              </div>
          </div>
        )}
      </div>

      <div className="flex justify-end space-x-4">
        <button
          type="button"
          onClick={onCancel}
          className="museum-button bg-[#3F4E4F]"
          disabled={loading}
        >
          Cancelar
        </button>
        <button
          type="submit"
          className="museum-button"
          disabled={loading}
        >
          {loading ? 'Guardando...' : empleado ? 'Actualizar' : 'Crear'}
        </button>
        </div>
      </div>
    </form>
  );
};

export default EmpleadoProfesionalForm; 