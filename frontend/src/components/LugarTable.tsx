import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Lugar } from '../types/lugar';

interface Props {
  onEdit: (lugar: Lugar) => void;
  onDelete: (lugar: Lugar) => void;
  refreshTrigger: number;
}

const LugarTable: React.FC<Props> = ({ onEdit, onDelete, refreshTrigger }) => {
  const [lugares, setLugares] = useState<Lugar[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchLugares();
  }, [refreshTrigger]);

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

  if (lugares.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        No hay lugares registrados
      </div>
    );
  }

  return (
    <div className="overflow-x-auto">
      <table className="museum-table">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Jerarquía</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {lugares.map((lugar) => (
            <tr key={lugar.id_lugar}>
              <td className="font-medium">{lugar.nombre_lugar}</td>
              <td>{lugar.tipo === 'pais' ? 'País' : 'Ciudad'}</td>
              <td>{lugar.jerarquia_nombre || '-'}</td>
              <td>
                <div className="flex space-x-2">
                  <button
                    onClick={() => onEdit(lugar)}
                    className="museum-button px-3 py-1 text-sm"
                  >
                    Editar
                  </button>
                  <button
                    onClick={() => onDelete(lugar)}
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

export default LugarTable; 