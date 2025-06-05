import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { ResumenHist } from '../types/resumen_hist';

interface Props {
  idMuseo: number;
  resumen: ResumenHist | null;
  onCancel: () => void;
  onSuccess: () => void;
}

const ResumenHistForm: React.FC<Props> = ({ idMuseo, resumen, onCancel, onSuccess }) => {
  const [formData, setFormData] = useState({
    ano: '',
    hechos_hist: ''
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (resumen) {
      setFormData({
        ano: new Date(resumen.ano).toISOString().split('T')[0],
        hechos_hist: resumen.hechos_hist
      });
    } else {
      setFormData({
        ano: '',
        hechos_hist: ''
      });
    }
  }, [resumen]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      const url = resumen
        ? `http://localhost:8000/resumenes-historicos/${idMuseo}/${resumen.ano}`
        : 'http://localhost:8000/resumenes-historicos/';

      const response = await fetch(url, {
        method: resumen ? 'PUT' : 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          ...formData,
          id_museo: idMuseo,
        }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al guardar el resumen histórico');
      }

      toast.success(
        resumen
          ? 'Resumen histórico actualizado exitosamente'
          : 'Resumen histórico creado exitosamente'
      );
      
      setFormData({ ano: '', hechos_hist: '' });
      onSuccess();
      onCancel();
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Error al guardar el resumen histórico');
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
        <div>
          <label htmlFor="ano" className="block text-sm font-medium text-[#2C3639]">
            Año
          </label>
          <input
            type="date"
            id="ano"
            value={formData.ano}
            onChange={(e) => setFormData({ ...formData, ano: e.target.value })}
            className="museum-input w-full"
            required
          />
        </div>

        <div className="sm:col-span-2">
          <label htmlFor="hechos_hist" className="block text-sm font-medium text-[#2C3639]">
            Hechos Históricos
          </label>
          <textarea
            id="hechos_hist"
            value={formData.hechos_hist}
            onChange={(e) => setFormData({ ...formData, hechos_hist: e.target.value })}
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
          {loading ? 'Guardando...' : resumen ? 'Actualizar' : 'Crear'}
        </button>
      </div>
    </form>
  );
};

export default ResumenHistForm; 