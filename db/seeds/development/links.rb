puts 'Creating Links'
Link.create!(
  title: "Winter Camp 2018: 60 Minutes Wrestling Crash Course with Christian Graugart",
  url: 'https://www.bjjglobetrotters.com/winter-camp-2018-60-minutes-wrestling-crash-course-with-christian-graugart/',
  user_id: 42,
  instructors: [Instructor.where(name: 'Christian Graugart').first],
  tags: [100, 1000].map{|t|  Tag.find(t)}
)

Link.create!(
  title: "Summer Camp 2017: Turtle seminar with Priit Mihkelson",
  url: 'https://www.bjjglobetrotters.com/summer-camp-2017-turtle-seminar-with-priit-mihkelson/',
  user_id: 42,
  tags: [101, 1000, 1001, 1102, 2006].map{|t|  Tag.find(t)}
)

Link.create!(
  title: "Fall Camp 2018: Super Fundamental principles / White Belt Survival Course (for all belts) with Christian Graugart",
  url: 'https://www.bjjglobetrotters.com/fall-camp-2018-super-fundamental-principles-white-belt-survival-course-with-christian-graugart/',
  user_id: 42,
  instructors: [Instructor.where(name: 'Christian Graugart').first],
  tags: [101, 1000, 1001, 1050].map{|t|  Tag.find(t)}
)

Link.create!(
  title: "Omoplata Setup with Options",
  url: 'https://www.instagram.com/p/BnIMOvllheq/',
  user_id: 42,
  tags: [101, 1000, 1051].map{|t|  Tag.find(t)}
)

Link.create!(
  title: "Triangle From Side Control",
  url: 'https://www.instagram.com/p/BnMduRMlqoS/',
  user_id: 42,
  tags: [101, 1000, 1051, 1076, 1101, Tag.where(category: 'start-position').where(name: 'side-mount').first.id].map{|t|  Tag.find(t)}
)

Link.create!(
  title: "Fall Camp 2018: Ass up head down passing with David Morcegao",
  url: "https://www.bjjglobetrotters.com/fall-camp-2018-ass-up-head-down-passing-with-david-morcegao/",
  user_id: 42,
  instructors: [Instructor.where(nickname: 'Morcegao').first],
  tags: [101, 1001, 1051, 1106, Tag.where(category: 'end-position').where(name: 'side-mount').first.id].map{|t|  Tag.find(t)}
)

Link.create!(
  title: "Summer Camp 2017: Arm drag from closed guard with David Morcegao",
  url: "https://www.bjjglobetrotters.com/summer-camp-2017-arm-drag-from-closed-guard-with-david-morcegao/",
  user_id: 42,
  instructors: [Instructor.where(nickname: 'Morcegao').first],
  tags: [101, 1001, 1050, 1106, Tag.where(category: 'start-position').where(name: 'have-guard').first.id, Tag.where(category: 'end-position').where(name: 'back-mount').first.id].map{|t|  Tag.find(t)}
)


# BEGIN Used for testing "in-submission" code
Link.create!(
  title: "Omaplata Escape to Front Headlock",
  url: "https://www.instagram.com/asaf_mich/p/BwaK6VeAzzg/",
  user_id: 42,
  tags: [
    Tag.find_by_full_name("start-position::in-submission"),
    Tag.find_by_full_name("end-position::kneeling"),
    Tag.find_by_full_name("move::escape"),
    Tag.find_by_full_name("submission::omaplata"),
    Tag.find_by_full_name("art::bjj")
  ]
)

Link.create!(
  title: "Inverted Kimura",
  url: "https://www.instagram.com/p/BwgIkfYAvZ6/",
  user_id: 42,
  tags: [
    Tag.find_by_full_name("start-position::in-submission"),
    Tag.find_by_full_name("move::submission"),
    Tag.find_by_full_name("submission::kimura"),
    Tag.find_by_full_name("art::bjj")
  ]
)

Link.create!(
  title: "Omaplata Escape",
  url: "https://www.instagram.com/p/BubkWJxgjCy/",
  user_id: 42,
  tags: [
    Tag.find_by_full_name("start-position::in-submission"),
    Tag.find_by_full_name("end-position::side-mount"),
    Tag.find_by_full_name("move::escape"),
    Tag.find_by_full_name("submission::omaplata"),
    Tag.find_by_full_name("art::bjj")
  ]
)

Link.create!(
  title: "Omaplata From Single Leg Attempt",
  url: "https://www.instagram.com/p/Bu2IXZqguxO/",
  user_id: 42,
  tags: [
    Tag.find_by_full_name("start-position::in-submission"),
    Tag.find_by_full_name("end-position::in-submission"),
    Tag.find_by_full_name("move::counter"),
    Tag.find_by_full_name("submission::omaplata"),
    Tag.find_by_full_name("art::bjj")
  ]
)
# END Used for testing "in-submission" code

Link.enqueue_thumbnails unless Rails.env.development?
