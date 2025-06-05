import { Link } from 'react-router-dom';

interface ModuleCard {
  title: string;
  description: string;
  path: string;
  icon: string;
  available: boolean;
}

const modules: ModuleCard[] = [
  {
    title: "Gestión de Lugares",
    description: "Administra países y ciudades donde se encuentran los museos.",
    path: "/lugares",
    icon: "🌎",
    available: true
  },
  {
    title: "Gestión de Museos",
    description: "Administra la información básica de los museos y sus ubicaciones.",
    path: "/museos",
    icon: "🏛️",
    available: true
  },
  {
    title: "Gestión de Obras",
    description: "Cataloga y administra las obras de arte de los museos.",
    path: "/obras",
    icon: "🎨",
    available: true
  },
  {
    title: "Gestión de Artistas",
    description: "Administra información sobre los artistas y sus obras.",
    path: "/artistas",
    icon: "👨‍🎨",
    available: false
  },
  {
    title: "Gestión de Personal",
    description: "Administra empleados profesionales y de mantenimiento.",
    path: "/empleados",
    icon: "👥",
    available: true
  },
  {
    title: "Estructura Organizacional",
    description: "Gestiona la estructura y jerarquía de los museos.",
    path: "/estructura",
    icon: "📊",
    available: false
  },
  {
    title: "Colecciones",
    description: "Administra las colecciones permanentes y su ubicación.",
    path: "/colecciones",
    icon: "🖼️",
    available: false
  },
  {
    title: "Estructura Física",
    description: "Gestiona edificios, pisos, áreas y salas de exposición.",
    path: "/estructura-fisica",
    icon: "🏗️",
    available: false
  },
  {
    title: "Eventos",
    description: "Gestiona eventos y exposiciones temporales.",
    path: "/eventos",
    icon: "📅",
    available: false
  },
  {
    title: "Tickets y Horarios",
    description: "Administra tickets, precios y horarios de apertura.",
    path: "/tickets",
    icon: "🎟️",
    available: false
  }
];

export default function HomePage() {
  return (
    <div className="min-h-screen flex flex-col items-center py-12 px-4">
      {/* Hero Section */}
      <div className="text-center mb-16">
        <h1 className="text-5xl font-playfair text-[#2C3639] mb-4">
          Sistema de Gestión de Museos
        </h1>
        <p className="text-xl text-[#3F4E4F] max-w-2xl mx-auto">
          Plataforma integral para la administración y gestión de museos, sus colecciones,
          personal y eventos.
        </p>
      </div>

      {/* Modules Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-7xl w-full">
        {modules.map((module) => (
          <div
            key={module.path}
            className={`museum-border p-6 rounded-lg ${
              module.available
                ? 'hover:bg-[#DCD7C9]/10 cursor-pointer transition-colors'
                : 'opacity-60 cursor-not-allowed'
            }`}
          >
            {module.available ? (
              <Link to={module.path} className="block h-full">
                <ModuleContent module={module} />
              </Link>
            ) : (
              <div className="relative">
                <ModuleContent module={module} />
                <div className="absolute top-0 right-0 bg-[#2C3639] text-[#DCD7C9] text-xs px-2 py-1 rounded">
                  Próximamente
                </div>
              </div>
            )}
          </div>
        ))}
      </div>

      {/* Footer Info */}
      <div className="mt-16 text-center text-[#3F4E4F]">
        <p className="text-sm">
          Sistema desarrollado para la gestión integral de museos según los estándares museológicos.
        </p>
      </div>
    </div>
  );
}

function ModuleContent({ module }: { module: ModuleCard }) {
  return (
    <>
      <div className="text-4xl mb-4">{module.icon}</div>
      <h2 className="text-2xl font-playfair text-[#2C3639] mb-2">
        {module.title}
      </h2>
      <p className="text-[#3F4E4F]">
        {module.description}
      </p>
    </>
  );
} 