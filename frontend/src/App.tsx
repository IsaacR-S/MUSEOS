import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Toaster } from 'react-hot-toast';
import Layout from './components/Layout';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import LugaresPage from './pages/LugaresPage';
import MuseosPage from './pages/MuseosPage';
import EmpleadosPage from './pages/EmpleadosPage';
import ObrasPage from './pages/ObrasPage';

export default function App() {
  return (
    <Router>
      <div className="min-h-screen bg-[#DCD7C9]">
        <Navbar />
        <main className="max-w-7xl mx-auto px-4 py-8">
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/lugares" element={<LugaresPage />} />
            <Route path="/museos" element={<MuseosPage />} />
            <Route path="/empleados" element={<EmpleadosPage />} />
            <Route path="/obras" element={<ObrasPage />} />
          </Routes>
        </main>
      </div>
      <Toaster position="top-right" />
    </Router>
  );
}
