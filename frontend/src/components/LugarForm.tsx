import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Lugar } from '../types/lugar';

interface Props {
  lugar: Lugar | null;
  onCancel: () => void;
  onSuccess: () => void;
  refreshTrigger: number;
}

const LugarForm: React.FC<Props> = ({ lugar, onCancel, onSuccess, refreshTrigger }) => {
  const [formData, setFormData] = useState({
    nombre_lugar: '',
    tipo: '',
    id_jerarquia: '',
  });
  const [lugares, setLugares] = useState<Lugar[]>([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchLugares();
  }, [refreshTrigger]);

  useEffect(() => {
    if (lugar) {
      setFormData({
        nombre_lugar: lugar.nombre_lugar,
        tipo: lugar.tipo,
        id_jerarquia: lugar.id_jerarquia?.toString() || '',
      });
    } else {
      setFormData({
        nombre_lugar: '',
        tipo: '',
        id_jerarquia: '',
      });
    }
  }, [lugar]);

  useEffect(() => {
    if (formData.tipo === 'pais') {
      setFormData(prev => ({ ...prev, id_jerarquia: '' }));
    }
  }, [formData.tipo]);

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
      const url = lugar
        ? `http://localhost:8000/lugares/${lugar.id_lugar}`
        : 'http://localhost:8000/lugares/';
      
      if (!['pais', 'ciudad'].includes(formData.tipo)) {
        throw new Error('El tipo debe ser pais o ciudad');
      }

      const response = await fetch(url, {
        method: lugar ? 'PUT' : 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          nombre_lugar: formData.nombre_lugar.trim(),
          tipo: formData.tipo,
          id_jerarquia: formData.id_jerarquia ? parseInt(formData.id_jerarquia) : null,
        }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al guardar el lugar');
      }

      toast.success(lugar ? 'Lugar actualizado exitosamente' : 'Lugar creado exitosamente');
      setFormData({ nombre_lugar: '', tipo: '', id_jerarquia: '' });
      onCancel();
      onSuccess();
    } catch (error) {
      console.error('Error completo:', error);
      toast.error(error instanceof Error ? error.message : 'Error al guardar el lugar');
    } finally {
      setLoading(false);
    }
  };

  const paisesFiltrados = lugares.filter(l => l.tipo === 'pais' && l.id_lugar !== lugar?.id_lugar);

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
        <div>
          <label htmlFor="nombre_lugar" className="block text-sm font-medium text-[#2C3639]">
            Nombre del Lugar
          </label>
          <input
            type="text"
            id="nombre_lugar"
            value={formData.nombre_lugar}
            onChange={(e) => setFormData({ ...formData, nombre_lugar: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div>
          <label htmlFor="tipo" className="block text-sm font-medium text-[#2C3639]">
            Tipo
          </label>
          <select
            id="tipo"
            value={formData.tipo}
            onChange={(e) => setFormData({ ...formData, tipo: e.target.value as "pais" | "ciudad" })}
            className="museum-input w-full"
            required
          >
            <option value="">Seleccione un tipo</option>
            <option value="pais">País</option>
            <option value="ciudad">Ciudad</option>
          </select>
        </div>

        {formData.tipo === 'ciudad' && (
          <div>
            <label htmlFor="id_jerarquia" className="block text-sm font-medium text-[#2C3639]">
              País
            </label>
            <select
              id="id_jerarquia"
              value={formData.id_jerarquia}
              onChange={(e) => setFormData({ ...formData, id_jerarquia: e.target.value })}
              className="museum-input w-full"
              required
            >
              <option value="">Seleccione un país</option>
              {paisesFiltrados.map((l) => (
                <option key={l.id_lugar} value={l.id_lugar}>
                  {l.nombre_lugar}
                </option>
              ))}
            </select>
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
          {loading ? 'Guardando...' : lugar ? 'Actualizar' : 'Crear'}
        </button>
      </div>
    </form>
  );
};

export default LugarForm; 