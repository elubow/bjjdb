puts 'Creating Gyms'

Gym.create!(
  id: 1,
  name: 'Warrior Fitness Center',
  website: 'https://cowarrior.com',
  phone: '+1.719.465.2136',
  email: 'info@cowarrior.com',
  affiliation: 'Ben Westrich',
  address_1: '3711 Drennan Road',
  city: 'Colorado Springs',
  state: 'Colorado',
  postal_code: '80910',
  country: 'United States',
  aasm_state: 'published'
)

Gym.create!(
  id: 2,
  name: 'Marcelo Garcia Academy',
  website: 'https://www.mginaction.com/',
  affiliation: 'Marcelo Garcia',
  address_full: '250 West 26th Street, New York, NY, USA',
  address_1: '250 West 26th Street',
  city: 'New York',
  state: 'NY',
  postal_code: '10001',
  country: 'United States',
  latitude: 0.407466825e2,
  longitude: -0.739962173e2,
  aasm_state: 'published'
)
