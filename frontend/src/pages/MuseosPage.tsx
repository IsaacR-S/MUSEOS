import { useState } from 'react';
import MuseoForm from '../components/MuseoForm';
import MuseoTable from '../components/MuseoTable';
import DeleteMuseoModal from '../components/DeleteMuseoModal';
import ResumenHistForm from '../components/ResumenHistForm';
import ResumenHistTable from '../components/ResumenHistTable';
import DeleteResumenHistModal from '../components/DeleteResumenHistModal';
import type { Museo } from '../types/museo';
import type { ResumenHist } from '../types/resumen_hist';

export default function MuseosPage() {
  const [selectedMuseo, setSelectedMuseo] = useState<Museo | null>(null);
  const [selectedResumen, setSelectedResumen] = useState<ResumenHist | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [isDeleteResumenModalOpen, setIsDeleteResumenModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [shouldRefresh, setShouldRefresh] = useState(0);
  const [activeMuseoId, setActiveMuseoId] = useState<number | null>(null);

  const handleEdit = (museo: Museo) => {
    setSelectedMuseo(museo);
    setIsEditing(true);
  };

  const handleDelete = (museo: Museo) => {
    setSelectedMuseo(museo);
    setIsDeleteModalOpen(true);
  };

  const handleCancelEdit = () => {
    setSelectedMuseo(null);
    setIsEditing(false);
  };

  const handleEditResumen = (resumen: ResumenHist) => {
    setSelectedResumen(resumen);
  };

  const handleDeleteResumen = (resumen: ResumenHist) => {
    setSelectedResumen(resumen);
    setIsDeleteResumenModalOpen(true);
  };

  const handleCancelResumenEdit = () => {
    setSelectedResumen(null);
  };

  const handleCloseResumenHist = () => {
    setActiveMuseoId(null);
    setSelectedResumen(null);
  };

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  const handleMuseoSuccess = (museo: Museo) => {
    refreshTable();
    if (!isEditing) {
      setActiveMuseoId(museo.id_museo);
    }
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Gestión de Museos</h2>
        <MuseoForm
          museo={isEditing ? selectedMuseo : null}
          onCancel={handleCancelEdit}
          onSuccess={handleMuseoSuccess}
          refreshTrigger={shouldRefresh}
        />
      </div>

      <div className="museum-border p-6 rounded-lg bg-white/80 backdrop-blur-sm">
        <h3 className="text-2xl font-playfair mb-6 text-center text-[#2C3639]">
          Museos Registrados
        </h3>
        <MuseoTable
          onEdit={handleEdit}
          onDelete={handleDelete}
          refreshTrigger={shouldRefresh}
          onSelect={(museo: Museo) => setActiveMuseoId(museo.id_museo)}
          selectedMuseoId={activeMuseoId}
        />
      </div>

      {activeMuseoId && (
        <div className="museum-border p-6 rounded-lg bg-white/80 backdrop-blur-sm">
          <div className="flex justify-between items-center mb-6">
            <h3 className="text-2xl font-playfair text-[#2C3639]">
              Resumen Histórico
            </h3>
            <button
              onClick={handleCloseResumenHist}
              className="museum-button bg-[#3F4E4F] px-3 py-1 text-sm"
              title="Cerrar resumen histórico"
            >
              ✕
            </button>
          </div>
          <div className="mb-8">
            <ResumenHistForm
              idMuseo={activeMuseoId}
              resumen={selectedResumen}
              onCancel={handleCancelResumenEdit}
              onSuccess={refreshTable}
            />
          </div>
          <ResumenHistTable
            idMuseo={activeMuseoId}
            onEdit={handleEditResumen}
            onDelete={handleDeleteResumen}
            refreshTrigger={shouldRefresh}
          />
        </div>
      )}

      <DeleteMuseoModal
        isOpen={isDeleteModalOpen}
        onClose={() => setIsDeleteModalOpen(false)}
        museo={selectedMuseo}
        onSuccess={refreshTable}
      />

      <DeleteResumenHistModal
        isOpen={isDeleteResumenModalOpen}
        onClose={() => setIsDeleteResumenModalOpen(false)}
        resumen={selectedResumen}
        onSuccess={refreshTable}
      />
    </div>
  );
} 