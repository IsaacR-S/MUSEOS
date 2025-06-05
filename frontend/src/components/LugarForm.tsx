import { PlusIcon } from '@heroicons/react/24/outline';
import type { Lugar, LugarFormData } from '../types';

interface Props {
  onSubmit: (data: LugarFormData) => void;
  lugares: Lugar[];
  initialData?: LugarFormData;
  isEdit?: boolean;
}

export default function LugarForm({ onSubmit, lugares, initialData, isEdit = false }: Props) {
  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    onSubmit({
      nombre_lugar: formData.get('nombre_lugar') as string,
      tipo: formData.get('tipo') as 'ciudad' | 'pais',
      id_jerarquia: formData.get('id_jerarquia') as string,
    });
  };

  return (
    <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 transition-all duration-300 hover:shadow-md">
      <div className="flex items-center mb-6">
        <div className="bg-primary-100 rounded-lg p-3 mr-4">
          <PlusIcon className="w-6 h-6 text-primary-600" />
        </div>
        <h2 className="text-xl font-semibold text-gray-800">
          {isEdit ? 'Editar Lugar' : 'Agregar Nuevo Lugar'}
        </h2>
      </div>

      <form onSubmit={handleSubmit} className="space-y-6">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="space-y-2">
            <label htmlFor="nombre_lugar" className="form-label">
              Nombre del Lugar
            </label>
            <input
              type="text"
              id="nombre_lugar"
              name="nombre_lugar"
              required
              defaultValue={initialData?.nombre_lugar}
              className="input-field"
              placeholder="Ingrese el nombre"
            />
          </div>

          <div className="space-y-2">
            <label htmlFor="tipo" className="form-label">
              Tipo
            </label>
            <select
              id="tipo"
              name="tipo"
              required
              defaultValue={initialData?.tipo}
              className="input-field"
            >
              <option value="">Seleccione un tipo</option>
              <option value="ciudad">Ciudad</option>
              <option value="pais">País</option>
            </select>
          </div>

          <div className="space-y-2">
            <label htmlFor="id_jerarquia" className="form-label">
              Jerarquía
            </label>
            <select
              id="id_jerarquia"
              name="id_jerarquia"
              defaultValue={initialData?.id_jerarquia}
              className="input-field"
            >
              <option value="">Seleccione una jerarquía</option>
              {lugares.map((lugar) => (
                <option key={lugar.id_lugar} value={lugar.id_lugar}>
                  {lugar.nombre_lugar}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex justify-end pt-4">
          <button type="submit" className="btn-primary">
            <PlusIcon className="w-5 h-5" />
            {isEdit ? 'Guardar Cambios' : 'Agregar Lugar'}
          </button>
        </div>
      </form>
    </div>
  );
} 