puts 'Creating Admin User'
User.create!(id: 42, email: 'eric@lubow.org', name: 'e', role: 'admin', password: 'test123', password_confirmation: 'test123')
