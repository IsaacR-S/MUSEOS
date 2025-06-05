import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { ResumenHist } from '../types/resumen_hist';

interface Props {
  idMuseo: number;
  onEdit: (resumen: ResumenHist) => void;
  onDelete: (resumen: ResumenHist) => void;
  refreshTrigger: number;
}

const ResumenHistTable: React.FC<Props> = ({ idMuseo, onEdit, onDelete, refreshTrigger }) => {
  const [resumenes, setResumenes] = useState<ResumenHist[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchResumenes();
  }, [idMuseo, refreshTrigger]);

  const fetchResumenes = async () => {
    try {
      const response = await fetch(`http://localhost:8000/resumenes-historicos/museo/${idMuseo}`);
      if (!response.ok) {
        throw new Error('Error al cargar los resúmenes históricos');
      }
      const data = await response.json();
      setResumenes(data);
    } catch (error) {
      toast.error('Error al cargar los resúmenes históricos');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="text-center py-8">
        <div className="inline-block animate-spin rounded-full h-8 w-8 border-4 border-[#A27B5C] border-t-transparent"></div>
      </div>
    );
  }

  if (resumenes.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        No hay resúmenes históricos registrados
      </div>
    );
  }

  return (
    <div className="overflow-x-auto">
      <table className="museum-table">
        <thead>
          <tr>
            <th>Año</th>
            <th>Hechos Históricos</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {resumenes.map((resumen) => (
            <tr key={`${resumen.id_museo}-${resumen.ano}`}>
              <td className="font-medium">
                {new Date(resumen.ano).getFullYear()}
              </td>
              <td>{resumen.hechos_hist}</td>
              <td>
                <div className="flex space-x-2">
                  <button
                    onClick={() => onEdit(resumen)}
                    className="museum-button px-3 py-1 text-sm"
                  >
                    Editar
                  </button>
                  <button
                    onClick={() => onDelete(resumen)}
                    className="museum-button bg-red-600 hover:bg-red-700 px-3 py-1 text-sm"
                  >
                    Eliminar
                  </button>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ResumenHistTable; 