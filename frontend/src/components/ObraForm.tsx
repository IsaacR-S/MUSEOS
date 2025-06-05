import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Obra } from '../types/obra';

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

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
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

      toast.success(
        obra
          ? 'Obra actualizada exitosamente'
          : 'Obra creada exitosamente'
      );
      
      setFormData({
        nombre_obra: '',
        fecha_periodo: '',
        tipo_obra: 'pintura',
        dimensiones: '',
        estilo_descripcion: '',
        descripcion_materiales_tecnicas: ''
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