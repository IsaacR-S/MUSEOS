import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Museo } from '../types/museo';
import type { Lugar } from '../types/lugar';
import axios from 'axios';

interface Props {
  museo: Museo | null;
  onCancel: () => void;
  onSuccess: (museo: Museo) => void;
  refreshTrigger: number;
}

interface ResumenHistForm {
  ano: string;
  hechos_hist: string;
}

const MuseoForm: React.FC<Props> = ({ museo, onCancel, onSuccess, refreshTrigger }) => {
  const [formData, setFormData] = useState({
    nombre: '',
    mision: '',
    fecha_fundacion: '',
    id_lugar: '',
  });
  const [lugares, setLugares] = useState<Lugar[]>([]);
  const [loading, setLoading] = useState(false);
  const [resumenesHist, setResumenesHist] = useState<ResumenHistForm[]>([{ ano: '', hechos_hist: '' }]);
  const [modo, setModo] = useState<'nuevo' | 'existente'>('nuevo');
  const [museoExistente, setMuseoExistente] = useState<string>('');
  const [museos, setMuseos] = useState<any[]>([]);

  useEffect(() => {
    fetchLugares();
  }, [refreshTrigger]);

  useEffect(() => {
    if (museo) {
      setFormData({
        nombre: museo.nombre,
        mision: museo.mision || '',
        fecha_fundacion: museo.fecha_fundacion,
        id_lugar: museo.id_lugar.toString(),
      });
    } else {
      setFormData({
        nombre: '',
        mision: '',
        fecha_fundacion: '',
        id_lugar: '',
      });
      setResumenesHist([{ ano: '', hechos_hist: '' }]);
    }
  }, [museo]);

  useEffect(() => {
    axios.get('http://localhost:8000/museos/').then(res => setMuseos(res.data));
  }, []);

  const fetchLugares = async () => {
    try {
      const response = await fetch('http://localhost:8000/lugares/', {
        headers: {
          'Content-Type': 'application/json',
        },
      });
      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al cargar lugares');
      }
      const data = await response.json();
      setLugares(data);
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Error al cargar lugares');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    try {
      if (modo === 'existente') {
        await axios.post(`http://localhost:8000/museos/${museoExistente}/resumenes`, resumenesHist);
        toast.success('Resumen(es) agregado(s) exitosamente');
        setResumenesHist([{ ano: '', hechos_hist: '' }]);
        setMuseoExistente('');
        onCancel();
        onSuccess();
        setLoading(false);
        return;
      }
      const url = museo
        ? `http://localhost:8000/museos/${museo.id_museo}`
        : 'http://localhost:8000/museos/';

      const museoData = {
        ...formData,
        resumenes_hist: resumenesHist.map(r => ({ ano: r.ano, hechos_hist: r.hechos_hist })),
        id_lugar: parseInt(formData.id_lugar),
      };

      const response = await fetch(url, {
        method: museo ? 'PUT' : 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(museoData),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al guardar el museo');
      }

      toast.success(museo ? 'Museo actualizado exitosamente' : 'Museo creado exitosamente');
      setFormData({ nombre: '', mision: '', fecha_fundacion: '', id_lugar: '' });
      setResumenesHist([{ ano: '', hechos_hist: '' }]);
      onCancel();
      onSuccess();
    } catch (error) {
      console.error('Error completo:', error);
      toast.error(error instanceof Error ? error.message : 'Error al guardar el museo');
    } finally {
      setLoading(false);
    }
  };

  const ciudadesFiltradas = lugares.filter(l => l.tipo === 'ciudad');

  const handleResumenChange = (idx: number, field: keyof ResumenHistForm, value: string) => {
    const nuevos = [...resumenesHist];
    nuevos[idx][field] = value;
    setResumenesHist(nuevos);
  };

  const agregarResumen = () => setResumenesHist([...resumenesHist, { ano: '', hechos_hist: '' }]);

  const quitarResumen = (idx: number) => setResumenesHist(resumenesHist.filter((_, i) => i !== idx));

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="mb-4">
        <label className="block text-sm font-medium text-[#2C3639]">¿Qué desea hacer?</label>
        <select value={modo} onChange={e => setModo(e.target.value as 'nuevo' | 'existente')} className="museum-input w-full">
          <option value="nuevo">Registrar nuevo museo</option>
          <option value="existente">Agregar resumen a museo existente</option>
        </select>
      </div>
      {modo === 'existente' && (
        <div className="mb-4">
          <label className="block text-sm font-medium text-[#2C3639]">Museo existente</label>
          <select value={museoExistente} onChange={e => setMuseoExistente(e.target.value)} className="museum-input w-full" required>
            <option value="">Seleccione un museo</option>
            {museos.map(m => (
              <option key={m.id_museo} value={m.id_museo}>{m.nombre}</option>
            ))}
          </select>
        </div>
      )}
      {modo === 'nuevo' && (
        <>
          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
            <div>
              <label htmlFor="nombre" className="block text-sm font-medium text-[#2C3639]">
                Nombre del Museo
              </label>
              <input
                type="text"
                id="nombre"
                value={formData.nombre}
                onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                className="museum-input w-full"
                required
                maxLength={50}
              />
            </div>

            <div>
              <label htmlFor="fecha_fundacion" className="block text-sm font-medium text-[#2C3639]">
                Fecha de Fundación
              </label>
              <input
                type="date"
                id="fecha_fundacion"
                value={formData.fecha_fundacion}
                onChange={(e) => setFormData({ ...formData, fecha_fundacion: e.target.value })}
                className="museum-input w-full"
                required
              />
            </div>

            <div className="sm:col-span-2">
              <label htmlFor="mision" className="block text-sm font-medium text-[#2C3639]">
                Misión
              </label>
              <textarea
                id="mision"
                value={formData.mision}
                onChange={(e) => setFormData({ ...formData, mision: e.target.value })}
                className="museum-input w-full h-32"
                maxLength={350}
              />
            </div>

            <div className="sm:col-span-2">
              <label htmlFor="id_lugar" className="block text-sm font-medium text-[#2C3639]">
                Ciudad
              </label>
              <select
                id="id_lugar"
                value={formData.id_lugar}
                onChange={(e) => setFormData({ ...formData, id_lugar: e.target.value })}
                className="museum-input w-full"
                required
              >
                <option value="">Seleccione una ciudad</option>
                {ciudadesFiltradas.map((lugar) => (
                  <option key={lugar.id_lugar} value={lugar.id_lugar}>
                    {lugar.nombre_lugar}
                  </option>
                ))}
              </select>
            </div>
          </div>
        </>
      )}

      <div className="mt-6">
        <h3 className="font-semibold text-lg mb-2">Resúmenes Históricos</h3>
        {resumenesHist.map((res, idx) => (
          <div key={idx} className="flex gap-2 mb-2">
            <input type="date" value={res.ano} onChange={e => handleResumenChange(idx, 'ano', e.target.value)} className="museum-input" required />
            <input type="text" value={res.hechos_hist} onChange={e => handleResumenChange(idx, 'hechos_hist', e.target.value)} className="museum-input flex-1" placeholder="Hechos históricos" required />
            {resumenesHist.length > 1 && <button type="button" onClick={() => quitarResumen(idx)}>-</button>}
          </div>
        ))}
        <button type="button" onClick={agregarResumen}>Agregar Resumen</button>
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
          {loading ? 'Guardando...' : museo ? 'Actualizar' : 'Crear'}
        </button>
      </div>
    </form>
  );
};

export default MuseoForm; 