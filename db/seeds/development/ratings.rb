puts 'Creating Ratings'

Rating.create!(
  value: 3,
  user_id: 42,
  link_id: Link.last.id
)

Rating.create!(
  value: 5,
  user_id: 69,
  link_id: Link.last.id
)

Rating.create!(
  value: 4,
  user_id: 42,
  link_id: Link.first.id
)
