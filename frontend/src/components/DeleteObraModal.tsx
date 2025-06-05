import { Fragment } from 'react';
import { Dialog, Transition } from '@headlessui/react';
import type { Obra } from '../types/obra';
import { toast } from 'react-hot-toast';

interface Props {
  isOpen: boolean;
  onClose: () => void;
  obra: Obra | null;
  onSuccess: () => void;
}

const DeleteObraModal: React.FC<Props> = ({ isOpen, onClose, obra, onSuccess }) => {
  const handleDelete = async () => {
    if (!obra) return;

    try {
      const response = await fetch(
        `http://localhost:8000/obras/${obra.id_obra}`,
        {
          method: 'DELETE',
        }
      );

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.detail || 'Error al eliminar la obra');
      }

      toast.success('Obra eliminada exitosamente');
      onClose();
      onSuccess();
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Error al eliminar la obra');
    }
  };

  return (
    <Transition appear show={isOpen} as={Fragment}>
      <Dialog as="div" className="relative z-10" onClose={onClose}>
        <Transition.Child
          as={Fragment}
          enter="ease-out duration-300"
          enterFrom="opacity-0"
          enterTo="opacity-100"
          leave="ease-in duration-200"
          leaveFrom="opacity-100"
          leaveTo="opacity-0"
        >
          <div className="fixed inset-0 bg-black bg-opacity-25" />
        </Transition.Child>

        <div className="fixed inset-0 overflow-y-auto">
          <div className="flex min-h-full items-center justify-center p-4 text-center">
            <Transition.Child
              as={Fragment}
              enter="ease-out duration-300"
              enterFrom="opacity-0 scale-95"
              enterTo="opacity-100 scale-100"
              leave="ease-in duration-200"
              leaveFrom="opacity-100 scale-100"
              leaveTo="opacity-0 scale-95"
            >
              <Dialog.Panel className="w-full max-w-md transform overflow-hidden rounded-2xl bg-white p-6 text-left align-middle shadow-xl transition-all">
                <Dialog.Title
                  as="h3"
                  className="text-lg font-medium leading-6 text-[#2C3639]"
                >
                  Confirmar Eliminación
                </Dialog.Title>
                <div className="mt-2">
                  <p className="text-sm text-[#3F4E4F]">
                    ¿Está seguro que desea eliminar la obra {obra?.nombre_obra}? Esta acción no se puede deshacer.
                  </p>
                </div>

                <div className="mt-4 flex justify-end space-x-4">
                  <button
                    type="button"
                    className="museum-button bg-[#3F4E4F]"
                    onClick={onClose}
                  >
                    Cancelar
                  </button>
                  <button
                    type="button"
                    className="museum-button bg-red-600 hover:bg-red-700"
                    onClick={handleDelete}
                  >
                    Eliminar
                  </button>
                </div>
              </Dialog.Panel>
            </Transition.Child>
          </div>
        </div>
      </Dialog>
    </Transition>
  );
};

export default DeleteObraModal; 