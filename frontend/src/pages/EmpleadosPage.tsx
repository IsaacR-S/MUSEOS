import { useState } from 'react';
import EmpleadoProfesionalForm from '../components/EmpleadoProfesionalForm';
import type { EmpleadoProfesional } from '../types/empleado_profesional';

export default function EmpleadosPage() {
  const [selectedEmpleado, setSelectedEmpleado] = useState<EmpleadoProfesional | null>(null);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [shouldRefresh, setShouldRefresh] = useState(0);

  const handleEdit = (empleado: EmpleadoProfesional) => {
    setSelectedEmpleado(empleado);
    setIsEditing(true);
  };

  const handleDelete = (empleado: EmpleadoProfesional) => {
    setSelectedEmpleado(empleado);
    setIsDeleteModalOpen(true);
  };

  const handleCancelEdit = () => {
    setSelectedEmpleado(null);
    setIsEditing(false);
  };

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Personal</h2>
        <EmpleadoProfesionalForm
          empleado={isEditing ? selectedEmpleado : null}
          onCancel={handleCancelEdit}
          onSuccess={refreshTable}
        />
      </div>
    </div>
  );
} 