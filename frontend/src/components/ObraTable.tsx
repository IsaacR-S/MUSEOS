import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Obra } from '../types/obra';

interface Props {
  onEdit: (obra: Obra) => void;
  onDelete: (obra: Obra) => void;
  refreshTrigger: number;
}

const ObraTable: React.FC<Props> = ({ onEdit, onDelete, refreshTrigger }) => {
  const [obras, setObras] = useState<Obra[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchObras();
  }, [refreshTrigger]);

  const fetchObras = async () => {
    try {
      const response = await fetch('http://localhost:8000/obras/');
      if (!response.ok) {
        throw new Error('Error al cargar las obras');
      }
      const data = await response.json();
      setObras(data);
    } catch (error) {
      toast.error('Error al cargar las obras');
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

  if (obras.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        No hay obras registradas
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
            <th>Período</th>
            <th>Dimensiones</th>
            <th>Estilo</th>
            <th>Materiales y Técnicas</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {obras.map((obra) => (
            <tr key={obra.id_obra}>
              <td className="font-medium">{obra.nombre_obra}</td>
              <td>{obra.tipo_obra}</td>
              <td>{obra.fecha_periodo}</td>
              <td>{obra.dimensiones}</td>
              <td>{obra.estilo_descripcion}</td>
              <td>{obra.descripcion_materiales_tecnicas}</td>
              <td>
                <div className="flex space-x-2">
                  <button
                    onClick={() => onEdit(obra)}
                    className="museum-button px-3 py-1 text-sm"
                  >
                    Editar
                  </button>
                  <button
                    onClick={() => onDelete(obra)}
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

export default ObraTable; 