puts 'Creating Reviews'

Review.create!(
  gym_id: 1,
  user_id: 42,
  stars: 5,
  body: 'Ben is a character. It was fun. Much excite!'
)

Review.create!(
  gym_id: 1,
  user_id: 69,
  stars: 1,
  body: "I'm a white belt and I don't know any better. Purple belt on staff was very scary."
)
