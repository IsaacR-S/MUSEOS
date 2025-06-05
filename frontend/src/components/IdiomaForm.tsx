import React, { useState } from 'react';
import { toast } from 'react-hot-toast';
import type { Idioma } from '../types/empleado_profesional';

interface Props {
  onSuccess: () => void;
}

const IdiomaForm: React.FC<Props> = ({ onSuccess }) => {
  const [nombre, setNombre] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      const response = await fetch('http://localhost:8000/idiomas/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ nombre }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al crear el idioma');
      }

      toast.success('Idioma creado exitosamente');
      setNombre('');
      onSuccess();
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Error al crear el idioma');
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="nombre" className="block text-sm font-medium text-[#2C3639]">
          Nombre del Idioma *
        </label>
        <input
          type="text"
          id="nombre"
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
          className="museum-input w-full"
          required
          placeholder="Ej: Inglés, Español, Francés..."
        />
      </div>

      <div className="flex justify-end">
        <button
          type="submit"
          className="museum-button"
          disabled={loading}
        >
          {loading ? 'Guardando...' : 'Crear Idioma'}
        </button>
      </div>
    </form>
  );
};

export default IdiomaForm; 