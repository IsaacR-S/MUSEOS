import { useState, useEffect } from 'react';
import axios from 'axios';
import toast, { Toaster } from 'react-hot-toast';
import type { Lugar } from './types/lugar';

interface LugarFormData {
  nombre_lugar: string;
  tipo: "pais" | "ciudad";
  id_jerarquia: string;
}

import LugarForm from './components/LugarForm';
import LugarTable from './components/LugarTable';
import DeleteModal from './components/DeleteModal';
import Layout from './components/Layout';

const API_URL = 'http://localhost:8000';

export default function App() {
  const [lugares, setLugares] = useState<Lugar[]>([]);
  const [selectedLugar, setSelectedLugar] = useState<Lugar | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [lugarToDelete, setLugarToDelete] = useState<number | null>(null);
  const [isEditing, setIsEditing] = useState(false);
  const [shouldRefresh, setShouldRefresh] = useState(0);

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

  const handleSubmit = async (formData: LugarFormData) => {
    try {
      // Convertir id_jerarquia a número o null
      const data = {
        ...formData,
        id_jerarquia: formData.id_jerarquia ? parseInt(formData.id_jerarquia) : null
      };

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

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  const handleEdit = (lugar: Lugar) => {
    setSelectedLugar(lugar);
    setIsEditing(true);
  };

  const handleDelete = (lugar: Lugar) => {
    setSelectedLugar(lugar);
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

  const handleCancelEdit = () => {
    setSelectedLugar(null);
    setIsEditing(false);
  };

  return (
    <Layout>
      <div className="space-y-8">
        <div className="museum-border p-6 rounded-lg">
          <h2 className="museum-header">Gestión de Lugares</h2>
          <LugarForm
            lugar={isEditing ? selectedLugar : null}
            onCancel={handleCancelEdit}
            onSuccess={refreshTable}
            refreshTrigger={shouldRefresh}
          />
        </div>

        <div className="museum-border p-6 rounded-lg bg-white/80 backdrop-blur-sm">
          <h3 className="text-2xl font-playfair mb-6 text-center text-[#2C3639]">
            Lugares Registrados
          </h3>
          <LugarTable
            onEdit={handleEdit}
            onDelete={handleDelete}
            refreshTrigger={shouldRefresh}
          />
        </div>

        <DeleteModal
          isOpen={isDeleteModalOpen}
          onClose={() => setIsDeleteModalOpen(false)}
          lugar={selectedLugar}
          onSuccess={refreshTable}
        />
      </div>
      <Toaster position="top-right" />
    </Layout>
  );
}
