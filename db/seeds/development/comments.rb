puts 'Creating Comments'

Comment.create!(
  user_id: 42,
  link_id: Link.last.id,
  body: 'Kind of a short comment. But at least it is something.'
)

Comment.create!(
  user_id: 69,
  link_id: Link.last.id,
  body: 'This is a response to the pointless comment.'
)

Comment.create!(
  user_id: 69,
  link_id: Link.first.id,
  body: 'I like to comment on things.'
)
