import { Link, useLocation } from 'react-router-dom';

export default function Navbar() {
  const location = useLocation();

  const isActive = (path: string) => {
    return location.pathname === path;
  };

  return (
    <nav className="bg-[#2C3639] shadow-lg">
      <div className="max-w-7xl mx-auto px-4">
        <div className="flex justify-between h-16">
          <div className="flex">
            <Link to="/" className="flex items-center">
              <span className="text-[#DCD7C9] text-xl font-playfair">
                Sistema de Museos
              </span>
            </Link>
          </div>
          <div className="flex space-x-8">
            <Link
              to="/lugares"
              className={`inline-flex items-center px-1 pt-1 text-sm font-medium ${
                isActive('/lugares')
                  ? 'text-[#BF9742] border-b-2 border-[#BF9742]'
                  : 'text-[#DCD7C9] hover:text-[#A27B5C]'
              }`}
            >
              Lugares
            </Link>
            <Link
              to="/museos"
              className={`inline-flex items-center px-1 pt-1 text-sm font-medium ${
                isActive('/museos')
                  ? 'text-[#BF9742] border-b-2 border-[#BF9742]'
                  : 'text-[#DCD7C9] hover:text-[#A27B5C]'
              }`}
            >
              Museos
            </Link>
            <Link
              to="/empleados"
              className={`inline-flex items-center px-1 pt-1 text-sm font-medium ${
                isActive('/empleados')
                  ? 'text-[#BF9742] border-b-2 border-[#BF9742]'
                  : 'text-[#DCD7C9] hover:text-[#A27B5C]'
              }`}
            >
              Personal
            </Link>
            <Link
              to="/obras"
              className={`inline-flex items-center px-1 pt-1 text-sm font-medium ${
                isActive('/obras')
                  ? 'text-[#BF9742] border-b-2 border-[#BF9742]'
                  : 'text-[#DCD7C9] hover:text-[#A27B5C]'
              }`}
            >
              Obras
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
} 