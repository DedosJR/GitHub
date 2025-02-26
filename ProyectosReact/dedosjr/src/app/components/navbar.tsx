"use client";
import { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="bg-gray-900 text-white shadow-md">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <div className="text-2xl font-bold">
            <Link href="/">Firebird</Link>
          </div>

          {/* Desktop Menu */}
          <div className="hidden md:flex space-x-8">
            <Link href="/" className="hover:text-gray-300 transition">
              Inicio
            </Link>
            <Link href="/about" className="hover:text-gray-300 transition">
              Nosotros
            </Link>
            <Link href="/services" className="hover:text-gray-300 transition">
              Servicios
            </Link>
            <Link href="/contact" className="hover:text-gray-300 transition">
              Contacto
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <div className="md:hidden">
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="text-white focus:outline-none focus:ring-2 focus:ring-gray-300"
            >
              {isOpen ? (
                <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
              ) : (
                <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16m-7 6h7" />
                </svg>
              )}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Menu Dropdown */}
      {isOpen && (
        <div className="md:hidden bg-gray-800">
          <div className="px-2 pt-2 pb-3 space-y-1">
            <Link href="/" className="block text-white hover:bg-gray-700 px-3 py-2 rounded-md">
              Inicio
            </Link>
            <Link href="/about" className="block text-white hover:bg-gray-700 px-3 py-2 rounded-md">
              Nosotros
            </Link>
            <Link href="/services" className="block text-white hover:bg-gray-700 px-3 py-2 rounded-md">
              Servicios
            </Link>
            <Link href="/contact" className="block text-white hover:bg-gray-700 px-3 py-2 rounded-md">
              Contacto
            </Link>
          </div>
        </div>
      )}
    </nav>
  );
}