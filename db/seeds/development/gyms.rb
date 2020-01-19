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
  country: 'US'
)
