puts 'Creating tags'
initial_timestamp = '2018-09-01 00:00:00 UTC'
puts '  Art Types'
[
  {
    id: 100,
    name: 'wrestling',
    description: 'Wrestling'
  },
  {
    id: 101,
    name: 'bjj',
    description: 'Brazilian Jiujitsu'
  },
  {
    id: 102,
    name: 'judo',
    description: 'Judo'
  },
  {
    id: 103,
    name: 'sambo',
    description: 'Sambo'
  }
].each do |t|
  Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'art',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
end

puts '  Pajama status'
[
  {
    id: 1000,
    name: 'nogi',
    description: 'less pajamas, more spandex'
  },
  {
    id: 1001,
    name: 'gi',
    description: 'pajamas'
  }
].each do |t|
  Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'uniform',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
end

puts '  Difficulty Level'
[
  {
    id: 1050,
    name: 'white',
    description: 'white belt level stuff'
  },
  {
    id: 1051,
    name: 'blue',
    description: 'blue belt level stuff'
  },
  {
    id: 1052,
    name: 'purple',
    description: 'purple belt level stuff'
  },
  {
    id: 1053,
    name: 'brown',
    description: 'brown belt level stuff'
  },
  {
    id: 1054,
    name: 'black',
    description: 'black belt level stuff'
  }
].each do |t|
  Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'difficulty',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
end

puts '  Flexibility Level'
[
  {
    id: 1075,
    name: 'none',
    description: 'no special flexibility'
  },
  {
    id: 1076,
    name: 'some',
    description: 'some flexibility required'
  },
  {
    id: 1077,
    name: 'lots',
    description: 'lots of flexibility required'
  },
  {
    id: 1078,
    name: 'insane',
    description: 'insane levels of flexibility required'
  }
].each do |t|
  Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'flexibility',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
end


puts '  Move types'
[
  {
    id: 1100,
    name: 'position',
    description: 'explanation about a specific position'
  },
  {
    id: 1101,
    name: 'submission',
    description: 'explanation of a submission'
  },
  {
    id: 1102,
    name: 'defense',
    description: 'explanation of a defense'
  },
  {
    id: 1103,
    name: 'counter',
    description: 'explanation of a counter'
  },
  {
    id: 1104,
    name: 'transition',
    description: 'explanation of a transition'
  },
  {
    id: 1105,
    name: 'setup',
    description: 'explanation of a setup'
  },
  {
    id: 1106,
    name: 'pass',
    description: 'explanation of a pass'
  },
  {
    id: 1107,
    name: 'takedown',
    description: 'explanation of a takedown'
  },
  {
    id: 1108,
    name: 'escape',
    description: 'explanation of an escape'
  },
  {
    id: 1109,
    name: 'throw',
    description: 'explanation of a throw'
  },
  {
    id: 1110,
    name: 'drill',
    description: 'explanation of a drill'
  },
  {
    id: 1111,
    name: 'flow',
    description: 'explanation of a flow'
  },
].each do |t|
  Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'move',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
end

puts '  Positions'
positions = [
  {
    id: 2000,
    name: 'guard',
    description: 'butt down, legs up'
  },
  {
    id: 2001,
    name: 'mount',
    description: 'mount'
  },
  {
    id: 2002,
    name: 'side-mount',
    description: 'side mount'
  },
  {
    id: 2003,
    name: 'back-mount',
    description: 'back mount'
  },
  {
    id: 2004,
    name: 'dlr',
    description: 'De La Riva'
  },
  {
    id: 2005,
    name: 'rdlr',
    description: 'Reverse De La Riva'
  },
  {
    id: 2006,
    name: 'turle',
    description: 'Turle'
  },
]

[['position', 0], ['start-position', 1000], ['end-position', 2000]].each do |cat, incr|
  puts "    Positions -- #{cat}"
  positions.each do |t|
    Tag.create!(
      id: t[:id] + incr,
      name: t[:name],
      description: t[:description],
      category: cat,
      created_at: initial_timestamp,
      updated_at: initial_timestamp
    )
  end
end


