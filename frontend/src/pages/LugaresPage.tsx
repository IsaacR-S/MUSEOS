import { useState } from 'react';
import LugarForm from '../components/LugarForm';

export default function LugaresPage() {
  const [shouldRefresh, setShouldRefresh] = useState(0);

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Lugares</h2>
        <LugarForm
          lugar={null}
          onCancel={() => {}}
          onSuccess={refreshTable}
          refreshTrigger={shouldRefresh}
        />
      </div>
    </div>
  );
} 