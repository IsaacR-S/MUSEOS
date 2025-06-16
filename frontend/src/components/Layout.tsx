import React from 'react';

interface LayoutProps {
  children: React.ReactNode;
}

const Layout: React.FC<LayoutProps> = ({ children }) => {
  return (
    <div className="min-h-screen">
      {/* Header */}
      <header className="bg-[#2C3639] text-white shadow-lg">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex justify-between items-center">
            <div className="flex items-center space-x-4">
              <svg xmlns="http://www.w3.org/2000/svg" className="h-10 w-10" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
              </svg>
              <h1 className="text-2xl font-playfair font-bold">Sistema de Museos</h1>
            </div>
            <nav className="hidden md:flex space-x-8">
              <a href="#" className="text-[#DCD7C9] hover:text-white transition-colors duration-200">Inicio</a>
              <a href="#" className="text-[#DCD7C9] hover:text-white transition-colors duration-200">Lugares</a>
              <a href="#" className="text-[#DCD7C9] hover:text-white transition-colors duration-200">Museos</a>
              <a href="#" className="text-[#DCD7C9] hover:text-white transition-colors duration-200">Reportes</a>
            </nav>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="museum-card">
          {children}
        </div>
      </main>
    </div>
  );
};

export default Layout; 