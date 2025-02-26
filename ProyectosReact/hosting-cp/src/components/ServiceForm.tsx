'use client'

import { useState } from 'react'
import { Service } from '@/types'

interface ServiceFormProps {
  onSubmit: (service: Omit<Service, 'id'>) => void
}

export default function ServiceForm({ onSubmit }: ServiceFormProps) {
  const [formData, setFormData] = useState({
    type: 'hosting',
    name: '',
    status: 'active'
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    onSubmit({
      type: formData.type as 'hosting' | 'domain' | 'streaming',
      name: formData.name,
      status: formData.status as 'active'
    })
    setFormData({
      type: 'hosting',
      name: '',
      status: 'active'
    })
  }

  return (
    <form onSubmit={handleSubmit} className="bg-black p-6 rounded-lg shadow-md">
      <h2 className="text-2xl font-semibold mb-6 text-black " >Add New Service</h2>
      <div className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Type
            <select
              name="type"
              value={formData.type}
              onChange={(e) => setFormData({ ...formData, type: e.target.value })}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
              <option value="hosting">Hosting</option>
              <option value="domain">Domain</option>
              <option value="streaming">Streaming</option>
            </select>
          </label>
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Name
            <input
              type="text"
              name="name"
              value={formData.name}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
              required
            />
          </label>
        </div>
        <button
          type="submit"
          className="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors"
        >
          Add Service
        </button>
      </div>
    </form>
  )
}