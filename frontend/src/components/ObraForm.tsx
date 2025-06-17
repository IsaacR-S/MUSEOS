import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Obra } from '../types/obra';
import type { Artista } from '../types/artista';
import type { Museo } from '../types/museo';
import type { EmpleadoProfesional } from '../types/empleado_profesional';
import axios from 'axios';

interface Props {
  obra: Obra | null;
  onCancel: () => void;
  onSuccess: () => void;
}

const ObraForm: React.FC<Props> = ({ obra, onCancel, onSuccess }) => {
  const [formData, setFormData] = useState({
    nombre_obra: '',
    fecha_periodo: '',
    tipo_obra: 'pintura',
    dimensiones: '',
    estilo_descripcion: '',
    descripcion_materiales_tecnicas: ''
  });
  const [loading, setLoading] = useState(false);
  const [artistas, setArtistas] = useState<Artista[]>([]);
  const [artistasSeleccionados, setArtistasSeleccionados] = useState<number[]>([]);
  const [mostrarFormArtista, setMostrarFormArtista] = useState(false);
  const [nuevoArtista, setNuevoArtista] = useState<Partial<Artista>>({});
  const [museos, setMuseos] = useState<Museo[]>([]);
  const [estructurasFisicas, setEstructurasFisicas] = useState<any[]>([]);
  const [salas, setSalas] = useState<any[]>([]);
  const [colecciones, setColecciones] = useState<any[]>([]);
  const [empleados, setEmpleados] = useState<EmpleadoProfesional[]>([]);
  const [historicos, setHistoricos] = useState<any[]>([]);
  const [movimiento, setMovimiento] = useState({
    id_museo_sala: '',
    id_estructura_fisica: '',
    id_sala: '',
    id_museo_coleccion: '',
    id_estructura_org_coleccion: '',
    id_coleccion: '',
    id_museo_empleado: '',
    id_estructura_org_empleado: '',
    id_empleado: '',
    fecha_inicio_empleado: '',
    fecha_inicio: '',
    tipo_obtencion: '',
    destacada: 'no',
    valor_obra: '',
    orden_recomendado: '',
  });
  const [estructurasOrgColeccion, setEstructurasOrgColeccion] = useState<any[]>([]);
  const [estructurasOrgEmpleado, setEstructurasOrgEmpleado] = useState<any[]>([]);
  const [museoSeleccionado, setMuseoSeleccionado] = useState<string>('');
  const [historicosEmpleado, setHistoricosEmpleado] = useState<any[]>([]);

  useEffect(() => {
    if (obra) {
      setFormData({
        nombre_obra: obra.nombre_obra,
        fecha_periodo: obra.fecha_periodo,
        tipo_obra: obra.tipo_obra,
        dimensiones: obra.dimensiones,
        estilo_descripcion: obra.estilo_descripcion,
        descripcion_materiales_tecnicas: obra.descripcion_materiales_tecnicas
      });
    } else {
      setFormData({
        nombre_obra: '',
        fecha_periodo: '',
        tipo_obra: 'pintura',
        dimensiones: '',
        estilo_descripcion: '',
        descripcion_materiales_tecnicas: ''
      });
    }
  }, [obra]);

  useEffect(() => {
    axios.get('http://localhost:8000/artistas').then(res => setArtistas(res.data));
  }, []);

  useEffect(() => {
    axios.get('http://localhost:8000/museos/').then(res => setMuseos(res.data));
  }, []);

  useEffect(() => {
    if (museoSeleccionado) {
      axios.get(`http://localhost:8000/estructuras-fisicas/${museoSeleccionado}`).then(res => setEstructurasFisicas(res.data));
    } else {
      setEstructurasFisicas([]);
    }
  }, [museoSeleccionado]);

  useEffect(() => {
    if (museoSeleccionado && movimiento.id_estructura_fisica) {
      axios.get(`http://localhost:8000/salas/${museoSeleccionado}/${movimiento.id_estructura_fisica}`).then(res => setSalas(res.data));
    } else {
      setSalas([]);
    }
  }, [museoSeleccionado, movimiento.id_estructura_fisica]);

  useEffect(() => {
    if (museoSeleccionado && movimiento.id_estructura_org_coleccion) {
      axios.get(`http://localhost:8000/colecciones/${museoSeleccionado}/${movimiento.id_estructura_org_coleccion}`).then(res => setColecciones(res.data));
    } else {
      setColecciones([]);
    }
  }, [museoSeleccionado, movimiento.id_estructura_org_coleccion]);

  useEffect(() => {
    if (museoSeleccionado && movimiento.id_estructura_org_empleado) {
      axios.get(`http://localhost:8000/empleados-profesionales/${museoSeleccionado}/${movimiento.id_estructura_org_empleado}`).then(res => setEmpleados(res.data));
    } else {
      setEmpleados([]);
    }
  }, [museoSeleccionado, movimiento.id_estructura_org_empleado]);

  useEffect(() => {
    if (museoSeleccionado) {
      axios.get(`http://localhost:8000/estructuras-org/${museoSeleccionado}`)
        .then(res => {
          setEstructurasOrgColeccion(res.data);
          setEstructurasOrgEmpleado(res.data);
        });
    } else {
      setEstructurasOrgColeccion([]);
      setEstructurasOrgEmpleado([]);
    }
  }, [museoSeleccionado]);

  useEffect(() => {
    setMovimiento(mov => ({
      ...mov,
      id_museo_sala: museoSeleccionado,
      id_museo_coleccion: museoSeleccionado,
      id_museo_empleado: museoSeleccionado
    }));
  }, [museoSeleccionado]);

  useEffect(() => {
    if (museoSeleccionado && movimiento.id_estructura_org_empleado) {
      axios.get(`http://localhost:8000/empleados-profesionales/historicos-empleado-detalle/${museoSeleccionado}/${movimiento.id_estructura_org_empleado}`)
        .then(res => setHistoricosEmpleado(res.data));
    } else {
      setHistoricosEmpleado([]);
    }
  }, [museoSeleccionado, movimiento.id_estructura_org_empleado]);

  const handleSeleccionArtistas = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const values = Array.from(e.target.selectedOptions, option => Number(option.value));
    setArtistasSeleccionados(values);
  };

  const handleGuardarArtista = async () => {
    try {
      const res = await axios.post('http://localhost:8000/artistas', nuevoArtista);
      setArtistas(prev => [...prev, res.data]);
      setArtistasSeleccionados(prev => [...prev, res.data.id_artista]);
      setMostrarFormArtista(false);
      setNuevoArtista({});
      toast.success('Artista creado exitosamente');
    } catch (error: any) {
      toast.error(error?.response?.data?.detail || 'Error al crear el artista');
    }
  };

  const handleMovimientoChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    setMovimiento({ ...movimiento, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      // 1. Crear la obra
      const url = obra
        ? `http://localhost:8000/obras/${obra.id_obra}`
        : 'http://localhost:8000/obras/';
      const response = await fetch(url, {
        method: obra ? 'PUT' : 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });
      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al guardar la obra');
      }
      const obraCreada = await response.json();
      // 2. Asignar artistas
      if (artistasSeleccionados.length > 0) {
        await axios.post(`http://localhost:8000/obras/${obraCreada.id_obra}/artistas`, {
          id_obra: obraCreada.id_obra,
          id_artistas: artistasSeleccionados
        });
      }
      // 3. Registrar el movimiento histórico SOLO si los campos clave están llenos
      const camposClave = [
        movimiento.id_estructura_fisica,
        movimiento.id_sala,
        movimiento.id_estructura_org_coleccion,
        movimiento.id_coleccion,
        movimiento.id_estructura_org_empleado,
        movimiento.id_empleado,
        movimiento.fecha_inicio_empleado,
        movimiento.fecha_inicio,
        movimiento.tipo_obtencion,
        movimiento.valor_obra
      ];
      const tieneMovimiento = camposClave.every(c => c && c !== '');
      if (tieneMovimiento) {
        const orden = movimiento.orden_recomendado ? parseInt(movimiento.orden_recomendado) : 1;
        await axios.post('http://localhost:8000/obras/historico-obra-movimiento/', {
          ...movimiento,
          id_obra: obraCreada.id_obra,
          valor_obra: parseFloat(movimiento.valor_obra),
          orden_recomendado: orden,
          id_museo_sala: museoSeleccionado,
          id_museo_coleccion: museoSeleccionado,
          id_museo_empleado: museoSeleccionado
        });
      }
      toast.success('Obra registrada exitosamente');
      setFormData({
        nombre_obra: '',
        fecha_periodo: '',
        tipo_obra: 'pintura',
        dimensiones: '',
        estilo_descripcion: '',
        descripcion_materiales_tecnicas: ''
      });
      setArtistasSeleccionados([]);
      setMovimiento({
        id_museo_sala: '',
        id_estructura_fisica: '',
        id_sala: '',
        id_museo_coleccion: '',
        id_estructura_org_coleccion: '',
        id_coleccion: '',
        id_museo_empleado: '',
        id_estructura_org_empleado: '',
        id_empleado: '',
        fecha_inicio_empleado: '',
        fecha_inicio: '',
        tipo_obtencion: '',
        destacada: 'no',
        valor_obra: '',
        orden_recomendado: '',
      });
      onSuccess();
      onCancel();
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Error al guardar la obra');
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
        <div className="sm:col-span-2">
          <label htmlFor="nombre_obra" className="block text-sm font-medium text-[#2C3639]">
            Nombre de la Obra *
          </label>
          <input
            type="text"
            id="nombre_obra"
            value={formData.nombre_obra}
            onChange={(e) => setFormData({ ...formData, nombre_obra: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="tipo_obra" className="block text-sm font-medium text-[#2C3639]">
            Tipo de Obra *
          </label>
          <select
            id="tipo_obra"
            value={formData.tipo_obra}
            onChange={(e) => setFormData({ ...formData, tipo_obra: e.target.value })}
            className="museum-input w-full"
            required
          >
            <option value="pintura">Pintura</option>
            <option value="escultura">Escultura</option>
          </select>
        </div>

        <div>
          <label htmlFor="fecha_periodo" className="block text-sm font-medium text-[#2C3639]">
            Período *
          </label>
          <input
            type="text"
            id="fecha_periodo"
            value={formData.fecha_periodo}
            onChange={(e) => setFormData({ ...formData, fecha_periodo: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="dimensiones" className="block text-sm font-medium text-[#2C3639]">
            Dimensiones *
          </label>
          <input
            type="text"
            id="dimensiones"
            value={formData.dimensiones}
            onChange={(e) => setFormData({ ...formData, dimensiones: e.target.value })}
            className="museum-input w-full"
            placeholder="Ej: 100x80cm"
            required
          />
        </div>

        <div>
          <label htmlFor="estilo_descripcion" className="block text-sm font-medium text-[#2C3639]">
            Estilo *
          </label>
          <input
            type="text"
            id="estilo_descripcion"
            value={formData.estilo_descripcion}
            onChange={(e) => setFormData({ ...formData, estilo_descripcion: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div className="sm:col-span-2">
          <label htmlFor="descripcion_materiales_tecnicas" className="block text-sm font-medium text-[#2C3639]">
            Materiales y Técnicas *
          </label>
          <textarea
            id="descripcion_materiales_tecnicas"
            value={formData.descripcion_materiales_tecnicas}
            onChange={(e) => setFormData({ ...formData, descripcion_materiales_tecnicas: e.target.value })}
            className="museum-input w-full h-32"
            required
          />
        </div>

        <div className="sm:col-span-2">
          <label className="block text-sm font-medium text-[#2C3639]">
            Artistas
          </label>
          <div className="flex gap-2 items-center">
            <select
              multiple
              value={artistasSeleccionados.map(String)}
              onChange={handleSeleccionArtistas}
              className="museum-input w-full"
            >
              {artistas.map(a => (
                <option key={a.id_artista} value={a.id_artista}>
                  {a.nombre_artista} {a.apellido_artista}
                </option>
              ))}
            </select>
            <button type="button" className="museum-button" onClick={() => setMostrarFormArtista(true)}>
              Agregar artista
            </button>
          </div>
          {mostrarFormArtista && (
            <div className="p-4 border rounded mt-2 bg-[#f9f6f2]">
              <h4 className="font-semibold mb-2">Nuevo Artista</h4>
              <div className="grid grid-cols-1 gap-2 sm:grid-cols-2">
                <input
                  placeholder="Nombre"
                  value={nuevoArtista.nombre_artista || ''}
                  onChange={e => setNuevoArtista({ ...nuevoArtista, nombre_artista: e.target.value })}
                  className="museum-input"
                />
                <input
                  placeholder="Apellido"
                  value={nuevoArtista.apellido_artista || ''}
                  onChange={e => setNuevoArtista({ ...nuevoArtista, apellido_artista: e.target.value })}
                  className="museum-input"
                />
                <div>
                  <label className="block text-xs text-[#2C3639] mb-1">Fecha de nacimiento</label>
                  <input
                    type="date"
                    value={nuevoArtista.fecha_nacimiento || ''}
                    onChange={e => setNuevoArtista({ ...nuevoArtista, fecha_nacimiento: e.target.value })}
                    className="museum-input"
                  />
                </div>
                <input
                  placeholder="Apodo"
                  value={nuevoArtista.apodo_artista || ''}
                  onChange={e => setNuevoArtista({ ...nuevoArtista, apodo_artista: e.target.value })}
                  className="museum-input"
                />
                <div>
                  <label className="block text-xs text-[#2C3639] mb-1">Fecha de muerte</label>
                  <input
                    type="date"
                    value={nuevoArtista.fecha_muerte || ''}
                    onChange={e => setNuevoArtista({ ...nuevoArtista, fecha_muerte: e.target.value })}
                    className="museum-input"
                  />
                </div>
                <input
                  placeholder="Descripción estilo/técnicas"
                  value={nuevoArtista.descripcion_estilo_tecnicas || ''}
                  onChange={e => setNuevoArtista({ ...nuevoArtista, descripcion_estilo_tecnicas: e.target.value })}
                  className="museum-input"
                />
              </div>
              <div className="flex gap-2 mt-2">
                <button type="button" className="museum-button" onClick={handleGuardarArtista}>
                  Guardar artista
                </button>
                <button type="button" className="museum-button bg-[#3F4E4F]" onClick={() => setMostrarFormArtista(false)}>
                  Cancelar
                </button>
              </div>
            </div>
          )}
        </div>

        <div className="sm:col-span-2">
          <label className="block text-sm font-medium text-[#2C3639]">Museo</label>
          <select name="museo" value={museoSeleccionado} onChange={e => setMuseoSeleccionado(e.target.value)} className="museum-input w-full" required>
            <option value="">Seleccione un museo</option>
            {museos.map(m => (
              <option key={m.id_museo} value={m.id_museo}>{m.nombre}</option>
            ))}
          </select>
        </div>

        <div className="sm:col-span-2 mt-8">
          <h3 className="font-semibold text-lg mb-2">Primer Movimiento de la Obra</h3>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Estructura Física</label>
              <select name="id_estructura_fisica" value={movimiento.id_estructura_fisica} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="">Seleccione una estructura</option>
                {estructurasFisicas.map(e => (
                  <option key={e.id_estructura_fisica} value={e.id_estructura_fisica}>{e.nombre}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Sala</label>
              <select name="id_sala" value={movimiento.id_sala} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="">Seleccione una sala</option>
                {salas.map(s => (
                  <option key={s.id_sala} value={s.id_sala}>{s.nombre_sala}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Estructura Org. (colección)</label>
              <select name="id_estructura_org_coleccion" value={movimiento.id_estructura_org_coleccion} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="">Seleccione una estructura organizacional</option>
                {estructurasOrgColeccion.map(e => (
                  <option key={e.id_estructura_org} value={e.id_estructura_org}>{e.nombre} ({e.nivel} - {e.tipo})</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Colección</label>
              <select name="id_coleccion" value={movimiento.id_coleccion} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="">Seleccione una colección</option>
                {colecciones.map(c => (
                  <option key={c.id_coleccion} value={c.id_coleccion}>{c.nombre_coleccion}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Estructura Org. (empleado)</label>
              <select name="id_estructura_org_empleado" value={movimiento.id_estructura_org_empleado} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="">Seleccione una estructura organizacional</option>
                {estructurasOrgEmpleado.map(e => (
                  <option key={e.id_estructura_org} value={e.id_estructura_org}>{e.nombre} ({e.nivel} - {e.tipo})</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Empleado Responsable</label>
              <select
                name="empleado_responsable"
                value={movimiento.id_empleado ? `${movimiento.id_empleado}|${movimiento.fecha_inicio_empleado}` : ''}
                onChange={e => {
                  const [id_empleado, fecha_inicio_empleado] = e.target.value.split('|');
                  setMovimiento({
                    ...movimiento,
                    id_empleado,
                    fecha_inicio_empleado
                  });
                }}
                className="museum-input w-full"
              >
                <option value="">Seleccione un empleado</option>
                {historicosEmpleado.map(h => (
                  <option key={h.id_empleado + '|' + h.fecha_inicio} value={`${h.id_empleado}|${h.fecha_inicio}`}>
                    {h.primer_nombre} {h.primer_apellido} (desde {h.fecha_inicio})
                  </option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Fecha Inicio Movimiento</label>
              <input type="date" name="fecha_inicio" value={movimiento.fecha_inicio} onChange={handleMovimientoChange} className="museum-input w-full" />
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Tipo de Obtención</label>
              <select name="tipo_obtencion" value={movimiento.tipo_obtencion} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="">Seleccione</option>
                <option value="comprado">Comprado</option>
                <option value="donado">Donado</option>
                <option value="comprado a otro museo">Comprado a otro museo</option>
                <option value="donado de otro museo">Donado de otro museo</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Destacada</label>
              <select name="destacada" value={movimiento.destacada} onChange={handleMovimientoChange} className="museum-input w-full">
                <option value="no">No</option>
                <option value="si">Sí</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-[#2C3639]">Valor de la Obra</label>
              <input type="number" name="valor_obra" value={movimiento.valor_obra} onChange={handleMovimientoChange} className="museum-input w-full" />
            </div>
            {/* Orden Recomendado solo si destacada es 'si' */}
            {movimiento.destacada === 'si' && (
              <div>
                <label className="block text-sm font-medium text-[#2C3639]">Orden Recomendado</label>
                <input
                  type="number"
                  name="orden_recomendado"
                  value={movimiento.orden_recomendado}
                  onChange={handleMovimientoChange}
                  className="museum-input w-full"
                  min={1}
                />
              </div>
            )}
          </div>
        </div>
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
          {loading ? 'Guardando...' : obra ? 'Actualizar' : 'Crear'}
        </button>
      </div>
    </form>
  );
};

export default ObraForm; 