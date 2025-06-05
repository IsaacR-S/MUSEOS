import React, { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { Idioma } from '../types/empleado_profesional';

interface Props {
  refreshTrigger: number;
  onDelete: (idioma: Idioma) => void;
}

const IdiomaTable: React.FC<Props> = ({ refreshTrigger, onDelete }) => {
  const [idiomas, setIdiomas] = useState<Idioma[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchIdiomas();
  }, [refreshTrigger]);

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

  if (idiomas.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        No hay idiomas registrados
      </div>
    );
  }

  return (
    <div className="overflow-x-auto">
      <table className="museum-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {idiomas.map((idioma) => (
            <tr key={idioma.id_idioma} className="border-b">
              <td>{idioma.id_idioma}</td>
              <td>{idioma.nombre}</td>
              <td>
                <button
                  onClick={() => onDelete(idioma)}
                  className="museum-button bg-red-600 hover:bg-red-700 px-3 py-1 text-sm"
                >
                  Eliminar
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default IdiomaTable; 