puts 'Creating Instructors'
Instructor.create!(
  name: 'Christian Graugart',
  instagram: '@graugart',
  twitter: '@bjjglobetrotters',
  website: 'https://www.bjjglobetrotters.com/',
  description: 'BJJ Globetrotters head honcho'
)

Instructor.create!(
  name: 'Bernardo Faria',
  website: 'https://www.bjjfanatics.com/',
  description: 'BJJ Fanatics'
)

Instructor.create!(
  name: 'David George',
  instagram: '@morcegaobjj',
  nickname: 'Morcegao',
  description: 'None'
)
