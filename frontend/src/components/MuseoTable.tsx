import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Museo } from '../types/museo';
import type { Lugar } from '../types/lugar';

interface Props {
  onEdit: (museo: Museo) => void;
  onDelete: (museo: Museo) => void;
  onSelect: (museo: Museo) => void;
  selectedMuseoId: number | null;
  refreshTrigger: number;
}

const MuseoTable: React.FC<Props> = ({ onEdit, onDelete, onSelect, selectedMuseoId, refreshTrigger }) => {
  const [museos, setMuseos] = useState<Museo[]>([]);
  const [lugares, setLugares] = useState<Lugar[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, [refreshTrigger]);

  const fetchData = async () => {
    try {
      const [museosResponse, lugaresResponse] = await Promise.all([
        fetch('http://localhost:8000/museos/'),
        fetch('http://localhost:8000/lugares/')
      ]);

      if (!museosResponse.ok || !lugaresResponse.ok) {
        throw new Error('Error al cargar los datos');
      }

      const [museosData, lugaresData] = await Promise.all([
        museosResponse.json(),
        lugaresResponse.json()
      ]);

      setMuseos(museosData);
      setLugares(lugaresData);
    } catch (error) {
      toast.error('Error al cargar los datos');
    } finally {
      setLoading(false);
    }
  };

  const getCiudadNombre = (id_lugar: number) => {
    const lugar = lugares.find(l => l.id_lugar === id_lugar);
    return lugar ? lugar.nombre_lugar : 'No encontrado';
  };

  if (loading) {
    return (
      <div className="text-center py-8">
        <div className="inline-block animate-spin rounded-full h-8 w-8 border-4 border-[#A27B5C] border-t-transparent"></div>
      </div>
    );
  }

  if (museos.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        No hay museos registrados
      </div>
    );
  }

  return (
    <div className="overflow-x-auto">
      <table className="museum-table">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Ciudad</th>
            <th>Fecha de Fundación</th>
            <th>Misión</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {museos.map((museo) => (
            <tr 
              key={museo.id_museo}
              className={`cursor-pointer ${selectedMuseoId === museo.id_museo ? 'bg-[#DCD7C9]/50' : ''}`}
              onClick={() => onSelect(museo)}
            >
              <td className="font-medium">{museo.nombre}</td>
              <td>{getCiudadNombre(museo.id_lugar)}</td>
              <td>{new Date(museo.fecha_fundacion).toLocaleDateString()}</td>
              <td>
                <div className="max-w-xs truncate">
                  {museo.mision || 'No especificada'}
                </div>
              </td>
              <td>
                <div className="flex space-x-2">
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      onEdit(museo);
                    }}
                    className="museum-button px-3 py-1 text-sm"
                  >
                    Editar
                  </button>
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      onDelete(museo);
                    }}
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

export default MuseoTable; 