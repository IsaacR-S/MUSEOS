import { useState } from 'react';
import EmpleadoProfesionalForm from '../components/EmpleadoProfesionalForm';
import EmpleadoProfesionalTable from '../components/EmpleadoProfesionalTable';
import DeleteEmpleadoProfesionalModal from '../components/DeleteEmpleadoProfesionalModal';
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
        <h2 className="museum-header">Gestión de Empleados Profesionales</h2>
        <EmpleadoProfesionalForm
          empleado={isEditing ? selectedEmpleado : null}
          onCancel={handleCancelEdit}
          onSuccess={refreshTable}
        />
      </div>

      <div className="museum-border p-6 rounded-lg bg-white/80 backdrop-blur-sm">
        <h3 className="text-2xl font-playfair mb-6 text-center text-[#2C3639]">
          Empleados Registrados
        </h3>
        <EmpleadoProfesionalTable
          onEdit={handleEdit}
          onDelete={handleDelete}
          refreshTrigger={shouldRefresh}
        />
      </div>

      <DeleteEmpleadoProfesionalModal
        isOpen={isDeleteModalOpen}
        onClose={() => setIsDeleteModalOpen(false)}
        empleado={selectedEmpleado}
        onSuccess={refreshTable}
      />
    </div>
  );
} 