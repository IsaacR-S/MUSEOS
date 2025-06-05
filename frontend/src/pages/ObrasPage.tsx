import { useState } from 'react';
import ObraForm from '../components/ObraForm';
import ObraTable from '../components/ObraTable';
import DeleteObraModal from '../components/DeleteObraModal';
import type { Obra } from '../types/obra';

export default function ObrasPage() {
  const [selectedObra, setSelectedObra] = useState<Obra | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [shouldRefresh, setShouldRefresh] = useState(0);

  const handleEdit = (obra: Obra) => {
    setSelectedObra(obra);
    setIsEditing(true);
  };

  const handleDelete = (obra: Obra) => {
    setSelectedObra(obra);
    setIsDeleteModalOpen(true);
  };

  const handleCancelEdit = () => {
    setSelectedObra(null);
    setIsEditing(false);
  };

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Gestión de Obras</h2>
        <ObraForm
          obra={isEditing ? selectedObra : null}
          onCancel={handleCancelEdit}
          onSuccess={refreshTable}
        />
      </div>

      <div className="museum-border p-6 rounded-lg bg-white/80 backdrop-blur-sm">
        <h3 className="text-2xl font-playfair mb-6 text-center text-[#2C3639]">
          Obras Registradas
        </h3>
        <ObraTable
          onEdit={handleEdit}
          onDelete={handleDelete}
          refreshTrigger={shouldRefresh}
        />
      </div>

      <DeleteObraModal
        isOpen={isDeleteModalOpen}
        onClose={() => setIsDeleteModalOpen(false)}
        obra={selectedObra}
        onSuccess={refreshTable}
      />
    </div>
  );
} 