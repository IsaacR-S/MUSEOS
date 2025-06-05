import { PencilIcon, TrashIcon, BuildingOfficeIcon } from '@heroicons/react/24/outline';
import type { Lugar } from '../types';

interface Props {
  lugares: Lugar[];
  onEdit: (lugar: Lugar) => void;
  onDelete: (id: number) => void;
}

export default function LugarTable({ lugares, onEdit, onDelete }: Props) {
  return (
    <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
      <div className="p-6 border-b border-gray-200">
        <div className="flex items-center">
          <div className="bg-primary-100 rounded-lg p-3 mr-4">
            <BuildingOfficeIcon className="w-6 h-6 text-primary-600" />
          </div>
          <h2 className="text-xl font-semibold text-gray-800">Lugares Registrados</h2>
        </div>
      </div>
      
      <div className="overflow-x-auto">
        <table className="min-w-full divide-y divide-gray-200">
          <thead className="bg-gray-50">
            <tr>
              <th className="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                ID
              </th>
              <th className="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Nombre
              </th>
              <th className="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Tipo
              </th>
              <th className="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Jerarquía
              </th>
              <th className="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Acciones
              </th>
            </tr>
          </thead>
          <tbody className="bg-white divide-y divide-gray-200">
            {lugares.map((lugar) => (
              <tr key={lugar.id_lugar} className="hover:bg-gray-50 transition-colors duration-200">
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                  {lugar.id_lugar}
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <div className="text-sm font-medium text-gray-900">{lugar.nombre_lugar}</div>
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <span
                    className={`px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${
                      lugar.tipo === 'pais'
                        ? 'bg-blue-100 text-blue-800'
                        : 'bg-green-100 text-green-800'
                    }`}
                  >
                    {lugar.tipo === 'pais' ? 'País' : 'Ciudad'}
                  </span>
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                  {lugar.jerarquia_nombre ? (
                    <div className="flex items-center">
                      <BuildingOfficeIcon className="w-4 h-4 mr-2 text-gray-400" />
                      {lugar.jerarquia_nombre}
                    </div>
                  ) : (
                    <span className="text-gray-400">N/A</span>
                  )}
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm font-medium">
                  <div className="flex space-x-3">
                    <button
                      onClick={() => onEdit(lugar)}
                      className="text-primary-600 hover:text-primary-900 flex items-center"
                    >
                      <PencilIcon className="w-4 h-4 mr-1" />
                      Editar
                    </button>
                    <button
                      onClick={() => onDelete(lugar.id_lugar)}
                      className="text-red-600 hover:text-red-900 flex items-center"
                    >
                      <TrashIcon className="w-4 h-4 mr-1" />
                      Eliminar
                    </button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
} 