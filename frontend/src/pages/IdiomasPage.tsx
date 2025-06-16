import React, { useState } from 'react';
import IdiomaForm from '../components/IdiomaForm';

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
        <h2 className="museum-header">Idiomas</h2>
        <IdiomaForm onSuccess={handleSuccess} />
      </div>
    </div>
  );
};

export default IdiomasPage; 