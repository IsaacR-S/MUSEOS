import React from 'react';
import { toast } from 'react-hot-toast';
import type { Idioma } from '../types/empleado_profesional';

interface Props {
  isOpen: boolean;
  onClose: () => void;
  idioma: Idioma | null;
  onSuccess: () => void;
}

const DeleteIdiomaModal: React.FC<Props> = ({ isOpen, onClose, idioma, onSuccess }) => {
  if (!isOpen || !idioma) return null;

  const handleDelete = async () => {
    try {
      const response = await fetch(`http://localhost:8000/idiomas/${idioma.id_idioma}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error('Error al eliminar el idioma');
      }

      toast.success('Idioma eliminado exitosamente');
      onSuccess();
      onClose();
    } catch (error) {
      toast.error('Error al eliminar el idioma');
    }
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg p-6 max-w-md w-full mx-4">
        <h2 className="text-2xl font-playfair text-[#2C3639] mb-4">
          Confirmar Eliminación
        </h2>
        <p className="text-[#3F4E4F] mb-6">
          ¿Está seguro de que desea eliminar el idioma <span className="font-semibold">{idioma.nombre}</span>?
          Esta acción no se puede deshacer.
        </p>
        <div className="flex justify-end space-x-4">
          <button
            onClick={onClose}
            className="museum-button bg-[#3F4E4F]"
          >
            Cancelar
          </button>
          <button
            onClick={handleDelete}
            className="museum-button bg-red-600 hover:bg-red-700"
          >
            Eliminar
          </button>
        </div>
      </div>
    </div>
  );
};

export default DeleteIdiomaModal; 