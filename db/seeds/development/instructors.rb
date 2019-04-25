puts 'Creating Instructors'
Instructor.create!(
  name: 'Christian Graugart',
  instagram: '@graugart',
  description: 'BJJ Globetrotters head honcho'
)

Instructor.create!(
  name: 'Bernardo Faria',
  description: 'BJJ Fanatics'
)

Instructor.create!(
  name: 'David George',
  nickname: 'Morcegao',
  description: 'None'
)
