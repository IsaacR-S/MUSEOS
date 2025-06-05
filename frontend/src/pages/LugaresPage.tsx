import { useState } from 'react';
import LugarForm from '../components/LugarForm';
import LugarTable from '../components/LugarTable';
import DeleteModal from '../components/DeleteModal';
import type { Lugar } from '../types/lugar';

export default function LugaresPage() {
  const [selectedLugar, setSelectedLugar] = useState<Lugar | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [shouldRefresh, setShouldRefresh] = useState(0);

  const handleEdit = (lugar: Lugar) => {
    setSelectedLugar(lugar);
    setIsEditing(true);
  };

  const handleDelete = (lugar: Lugar) => {
    setSelectedLugar(lugar);
    setIsDeleteModalOpen(true);
  };

  const handleCancelEdit = () => {
    setSelectedLugar(null);
    setIsEditing(false);
  };

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  return (
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
  );
} 