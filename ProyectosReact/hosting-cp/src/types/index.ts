export interface Service {
    id: number
    type: 'hosting' | 'domain' | 'streaming'
    name: string
    status: 'active' | 'inactive'
  }