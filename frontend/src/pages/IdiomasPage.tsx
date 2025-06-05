import React, { useState } from 'react';
import IdiomaForm from '../components/IdiomaForm';
import IdiomaTable from '../components/IdiomaTable';
import DeleteIdiomaModal from '../components/DeleteIdiomaModal';
import type { Idioma } from '../types/empleado_profesional';

const IdiomasPage: React.FC = () => {
  const [refreshTrigger, setRefreshTrigger] = useState(0);
  const [selectedIdioma, setSelectedIdioma] = useState<Idioma | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);

  const handleSuccess = () => {
    setRefreshTrigger(prev => prev + 1);
  };

  const handleDelete = (idioma: Idioma) => {
    setSelectedIdioma(idioma);
    setIsDeleteModalOpen(true);
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Gestión de Idiomas</h2>
        <IdiomaForm onSuccess={handleSuccess} />
      </div>

      <div className="museum-border p-6 rounded-lg bg-white/80 backdrop-blur-sm">
        <h3 className="text-2xl font-playfair mb-6 text-center text-[#2C3639]">
          Idiomas Registrados
        </h3>
        <IdiomaTable 
          refreshTrigger={refreshTrigger} 
          onDelete={handleDelete}
        />
      </div>

      <DeleteIdiomaModal
        isOpen={isDeleteModalOpen}
        onClose={() => setIsDeleteModalOpen(false)}
        idioma={selectedIdioma}
        onSuccess={handleSuccess}
      />
    </div>
  );
};

export default IdiomasPage; 