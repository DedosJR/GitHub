import { Service } from '@/types'

interface ServiceListProps {
  services: Service[]
  onDelete: (id: number) => void
  onUpdate: (service: Service) => void
}

export default function ServiceList({ services, onDelete, onUpdate }: ServiceListProps) {
  return (
    <div className="mt-8">
      <h2 className="text-2xl font-semibold mb-4">Services</h2>
      <div className="overflow-x-auto">
        <table className="min-w-full bg-white rounded-lg overflow-hidden">
          <thead className="bg-blue-600">
            <tr>
              <th className="px-6 py-3 text-left text-white font-semibold">Type</th>
              <th className="px-6 py-3 text-left text-white font-semibold">Name</th>
              <th className="px-6 py-3 text-left text-white font-semibold">Status</th>
              <th className="px-6 py-3 text-left text-white font-semibold">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200">
            {services.map(service => (
              <tr key={service.id}>
                <td className="px-6 py-4 text-black">{service.type}</td>
                <td className="px-6 py-4 text-black">{service.name}</td>
                <td className="px-6 py-4">
                  <span className={`px-2 py-1 rounded-full text-sm ${
                    service.status === 'active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                  }`}>
                    {service.status}
                  </span>
                </td>
                <td className="px-6 py-4">
                  <button
                    onClick={() => onDelete(service.id)}
                    className="bg-red-500 text-white px-3 py-1 rounded-md mr-2 hover:bg-red-600"
                  >
                    Delete
                  </button>
                  <button
                    onClick={() => onUpdate({ 
                      ...service, 
                      status: service.status === 'active' ? 'inactive' : 'active' 
                    })}
                    className="bg-blue-500 text-white px-3 py-1 rounded-md hover:bg-blue-600"
                  >
                    Toggle Status
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}