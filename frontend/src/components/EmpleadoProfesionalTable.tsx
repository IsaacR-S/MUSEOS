import { useState, useEffect } from 'react';
import { toast } from 'react-hot-toast';
import type { EmpleadoProfesional } from '../types/empleado_profesional';

interface Props {
  onEdit: (empleado: EmpleadoProfesional) => void;
  onDelete: (empleado: EmpleadoProfesional) => void;
  refreshTrigger: number;
}

const EmpleadoProfesionalTable: React.FC<Props> = ({ onEdit, onDelete, refreshTrigger }) => {
  const [empleados, setEmpleados] = useState<EmpleadoProfesional[]>([]);
  const [loading, setLoading] = useState(true);
  const [expandedRows, setExpandedRows] = useState<number[]>([]);

  useEffect(() => {
    fetchEmpleados();
  }, [refreshTrigger]);

  const fetchEmpleados = async () => {
    try {
      const response = await fetch('http://localhost:8000/empleados-profesionales/');
      if (!response.ok) {
        throw new Error('Error al cargar los empleados');
      }
      const data = await response.json();
      setEmpleados(data);
    } catch (error) {
      toast.error('Error al cargar los empleados');
    } finally {
      setLoading(false);
    }
  };

  const toggleRow = (id: number) => {
    setExpandedRows(prev => 
      prev.includes(id) 
        ? prev.filter(rowId => rowId !== id)
        : [...prev, id]
    );
  };

  if (loading) {
    return (
      <div className="text-center py-8">
        <div className="inline-block animate-spin rounded-full h-8 w-8 border-4 border-[#A27B5C] border-t-transparent"></div>
      </div>
    );
  }

  if (empleados.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        No hay empleados registrados
      </div>
    );
  }

  return (
    <div className="overflow-x-auto">
      <table className="museum-table">
        <thead>
          <tr>
            <th></th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Fecha de Nacimiento</th>
            <th>Documento</th>
            <th>Contacto</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {empleados.map((empleado) => (
            <>
              <tr key={empleado.id_empleado_prof} className="border-b">
                <td className="w-10">
                  <button
                    onClick={() => toggleRow(empleado.id_empleado_prof!)}
                    className="text-[#2C3639] hover:text-[#A27B5C] transition-colors"
                  >
                    {expandedRows.includes(empleado.id_empleado_prof!)
                      ? '▼'
                      : '▶'}
                  </button>
                </td>
                <td className="font-medium">
                  {empleado.primer_nombre} {empleado.segundo_nombre || ''}
                </td>
                <td>
                  {empleado.primer_apellido} {empleado.segundo_apellido}
                </td>
                <td>{new Date(empleado.fecha_nacimiento).toLocaleDateString()}</td>
                <td>{empleado.doc_identidad}</td>
                <td>{empleado.dato_contacto || 'No especificado'}</td>
                <td>
                  <div className="flex space-x-2">
                    <button
                      onClick={() => onEdit(empleado)}
                      className="museum-button px-3 py-1 text-sm"
                    >
                      Editar
                    </button>
                    <button
                      onClick={() => onDelete(empleado)}
                      className="museum-button bg-red-600 hover:bg-red-700 px-3 py-1 text-sm"
                    >
                      Eliminar
                    </button>
                  </div>
                </td>
              </tr>
              {expandedRows.includes(empleado.id_empleado_prof!) && (
                <tr>
                  <td colSpan={7} className="bg-[#DCD7C9] p-4">
                    <div className="pl-10">
                      <h4 className="text-[#2C3639] font-medium mb-3">Formación Profesional</h4>
                      {empleado.formaciones && empleado.formaciones.length > 0 ? (
                        <div className="grid gap-4">
                          {empleado.formaciones.map((formacion, index) => (
                            <div key={index} className="bg-white p-3 rounded-lg shadow-sm">
                              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div>
                                  <span className="text-sm text-[#3F4E4F] font-medium">Título:</span>
                                  <p className="text-[#2C3639]">{formacion.nombre_titulo}</p>
                                </div>
                                <div>
                                  <span className="text-sm text-[#3F4E4F] font-medium">Año:</span>
                                  <p className="text-[#2C3639]">
                                    {new Date(formacion.ano).getFullYear()}
                                  </p>
                                </div>
                                <div>
                                  <span className="text-sm text-[#3F4E4F] font-medium">Especialidad:</span>
                                  <p className="text-[#2C3639]">{formacion.descripcion_especialidad}</p>
                                </div>
                              </div>
                            </div>
                          ))}
                        </div>
                      ) : (
                        <p className="text-gray-500 italic">No hay formaciones registradas</p>
                      )}
                    </div>
                  </td>
                </tr>
              )}
            </>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default EmpleadoProfesionalTable; 