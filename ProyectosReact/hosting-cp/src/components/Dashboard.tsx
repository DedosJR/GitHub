'use client'

import { useState, useEffect } from 'react'
import ServiceList from './ServiceList'
import ServiceForm from './ServiceForm'
import { Service } from '@/types'

export default function Dashboard() {
  const [services, setServices] = useState<Service[]>([])

  useEffect(() => {
    // Mock data - replace with API call
    const mockData = [
      { id: 1, type: 'hosting', name: 'Web Hosting Basic', status: 'active' },
      { id: 2, type: 'domain', name: 'example.com', status: 'active' },
      { id: 3, type: 'streaming', name: 'Radio Stream 128kbps', status: 'active' }
    ]
    setServices(mockData as Service[])
  }, [])

  const addService = (service: Omit<Service, 'id'>) => {
    setServices([...services, { ...service, id: Date.now() }])
  }

  const deleteService = (id: number) => {
    setServices(services.filter(service => service.id !== id))
  }

  const updateService = (updatedService: Service) => {
    setServices(services.map(service => 
      service.id === updatedService.id ? updatedService : service
    ))
  }

  return (
    <div className="max-w-6xl mx-auto">
      <h1 className="text-3xl font-bold mb-8">Control Panel</h1>
      <ServiceForm onSubmit={addService} />
      <ServiceList 
        services={services}
        onDelete={deleteService}
        onUpdate={updateService}
      />
    </div>
  )
}