import { useState } from 'react';
import ObraForm from '../components/ObraForm';
import type { Obra } from '../types/obra';

export default function ObrasPage() {
  const [shouldRefresh, setShouldRefresh] = useState(0);

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Obras</h2>
        <ObraForm
          obra={null}
          onCancel={() => {}}
          onSuccess={refreshTable}
        />
      </div>
    </div>
  );
} 