import { useState, useEffect } from 'react';
import axios from 'axios';
import toast, { Toaster } from 'react-hot-toast';
import type { Lugar, LugarFormData } from './types';
import LugarForm from './components/LugarForm';
import LugarTable from './components/LugarTable';
import DeleteModal from './components/DeleteModal';

const API_URL = 'http://localhost:8000';

export default function App() {
  const [lugares, setLugares] = useState<Lugar[]>([]);
  const [selectedLugar, setSelectedLugar] = useState<Lugar | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [lugarToDelete, setLugarToDelete] = useState<number | null>(null);

  useEffect(() => {
    fetchLugares();
  }, []);

  const fetchLugares = async () => {
    try {
      const response = await axios.get(`${API_URL}/lugares`);
      setLugares(response.data);
    } catch (error) {
      toast.error('Error al cargar los lugares');
    }
  };

  const handleSubmit = async (data: LugarFormData) => {
    try {
      if (selectedLugar) {
        await axios.put(`${API_URL}/lugares/${selectedLugar.id_lugar}`, data);
        toast.success('Lugar actualizado exitosamente');
      } else {
        await axios.post(`${API_URL}/lugares`, data);
        toast.success('Lugar agregado exitosamente');
      }
      setSelectedLugar(null);
      fetchLugares();
    } catch (error: any) {
      if (error.response?.data?.detail) {
        toast.error(error.response.data.detail);
      } else {
        toast.error('Error al guardar el lugar');
      }
    }
  };

  const handleEdit = (lugar: Lugar) => {
    setSelectedLugar(lugar);
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const handleDelete = (id: number) => {
    setLugarToDelete(id);
    setIsDeleteModalOpen(true);
  };

  const confirmDelete = async () => {
    if (!lugarToDelete) return;

    try {
      await axios.delete(`${API_URL}/lugares/${lugarToDelete}`);
      toast.success('Lugar eliminado exitosamente');
      setIsDeleteModalOpen(false);
      setLugarToDelete(null);
      fetchLugares();
    } catch (error: any) {
      if (error.response?.data?.detail) {
        toast.error(error.response.data.detail);
      } else {
        toast.error('Error al eliminar el lugar');
      }
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="space-y-8">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Gestión de Lugares</h1>
            <p className="mt-2 text-sm text-gray-500">
              Administre los lugares disponibles en el sistema
            </p>
          </div>

          <LugarForm
            onSubmit={handleSubmit}
            lugares={lugares}
            initialData={
              selectedLugar
                ? {
                    nombre_lugar: selectedLugar.nombre_lugar,
                    tipo: selectedLugar.tipo,
                    id_jerarquia: selectedLugar.id_jerarquia?.toString() || '',
                  }
                : undefined
            }
            isEdit={!!selectedLugar}
          />

          <LugarTable lugares={lugares} onEdit={handleEdit} onDelete={handleDelete} />
        </div>
      </div>

      <DeleteModal
        isOpen={isDeleteModalOpen}
        onClose={() => setIsDeleteModalOpen(false)}
        onConfirm={confirmDelete}
      />

      <Toaster position="top-right" />
    </div>
  );
}
