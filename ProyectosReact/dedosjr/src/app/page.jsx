import Navbar from "./components/navbar";


export default function Home() {
  return (
    <div>
      <Navbar />
      <main className="p-10">
        <h1 className="text-4xl font-bold">Bienvenido a Firebird</h1>
        <p className="mt-4 text-gray-700">
          Explora nuestros servicios de venta de carros.
        </p>
      </main>
    </div>
  );

}