import { useState } from 'react';
import MuseoForm from '../components/MuseoForm';
import ResumenHistForm from '../components/ResumenHistForm';

export default function MuseosPage() {
  const [shouldRefresh, setShouldRefresh] = useState(0);

  const refreshTable = () => {
    setShouldRefresh(prev => prev + 1);
  };

  return (
    <div className="space-y-8">
      <div className="museum-border p-6 rounded-lg">
        <h2 className="museum-header">Museos</h2>
        <MuseoForm
          museo={null}
          onCancel={() => {}}
          onSuccess={refreshTable}
          refreshTrigger={shouldRefresh}
        />
      </div>
    </div>
  );
} 