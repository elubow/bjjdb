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

puts '  Build Types'
[
  {
    id: 200,
    name: 'little-people',
    description: 'BJJ for smol people'
  },
  {
    id: 201,
    name: 'big-boy',
    description: 'BJJ for big bois'
  },
  {
    id: 202,
    name: 'long-boy',
    description: 'moves that work best for the lanky'
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
  {
    id: 1112,
    name: 'sweep',
    description: 'explanation of a flow'
  },
  {
    id: 1113,
    name: 'theory',
    description: 'general bjj theory'
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
    name: 'have-guard',
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
    name: 'turtle',
    description: 'Turtle'
  },
  {
    id: 2007,
    name: 'single-leg-x',
    description: 'Single Leg X Guard'
  },
  {
    id: 2008,
    name: 'x-guard',
    description: 'X Guard'
  },
  {
    id: 2009,
    name: 'butterfly-guard',
    description: 'Butterfly Guard'
  },
  {
    id: 2010,
    name: 'half-butterfly-guard',
    description: 'Half Butterfly Guard'
  },
  {
    id: 2011,
    name: 'z-guard',
    description: 'Z Guard'
  },
  {
    id: 2012,
    name: 'quarter-guard',
    description: 'Quarter Guard (1/4)'
  },
  {
    id: 2013,
    name: 'half-guard',
    description: 'Half Guard (1/2)'
  },
  {
    id: 2014,
    name: 'three-quarter-guard',
    description: 'Three Quarter Guard (3/4)'
  },
  {
    id: 2015,
    name: 'quarter-z-guard',
    description: 'Quarter Z Guard (1/4 Z)'
  },
  {
    id: 2016,
    name: 'spider-guard',
    description: 'Spider Guard'
  },
  {
    id: 2017,
    name: 'deep-half-guard',
    description: 'Deep Half Guard'
  },
  {
    id: 2018,
    name: 'knee-shield',
    description: 'Knee Shield'
  },
  {
    id: 2019,
    name: 'whizzer',
    description: 'Whizzer'
  },
  {
    id: 2020,
    name: 'ashi-garami',
    description: 'Ashi Garami'
  },
  {
    id: 2021,
    name: 'north-south',
    description: 'North South'
  },
  {
    id: 2022,
    name: 'standing',
    description: 'Standing'
  },
  {
    id: 2023,
    name: '50-50',
    description: '50-50'
  },
  {
    id: 2024,
    name: 'kneeling',
    description: 'on your knees'
  },
  {
    id: 2025,
    name: 'seated',
    description: 'on your butt'
  },
  {
    id: 2026,
    name: 'truck',
    description: 'truck position'
  },
  {
    id: 2027,
    name: 'crucifix',
    description: 'crucifix position'
  },
  {
    id: 2028,
    name: 'knee-on-belly',
    description: 'knee on belly'
  },
  {
    id: 2029,
    name: 'worm-guard',
    description: 'Worm Guard'
  },
  {
    id: 2030,
    name: 'lasso-guard',
    description: 'Lasso Guard'
  },
  {
    id: 2031,
    name: 'berimbolo',
    description: 'Rolling stuff'
  },
  {
    id: 2032,
    name: 'in-guard',
    description: 'in someone else\'s guard'
  },
  {
    id: 2033,
    name: 'guard',
    description: 'having or being in guard'
  },
  {
    id: 2034,
    name: 'pocket-guard',
    description: 'pocket guard'
  },
  {
    id: 2035,
    name: 'in-submission',
    description: 'having or being in a submission'
  }
]

# position 2XXX
# start-position 3XXX
# end-position 4XXX
positions.each do |t|
  puts "    Positions -- position::#{t[:name]} >> {start, end}"
  t = Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'position',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
  t.create_start_end_position_tags
end

puts '  Submissions'
[
  {
    id: 10001,
    name: 'guillotine',
    description: 'Any guillotine or guillotine variation should be tagged with this'
  },
  {
    id: 10002,
    name: 'arm-lock',
    description: 'Any arm lock or arm lock variation should be tagged with this'
  },
  {
    id: 10003,
    name: 'wrist-lock',
    description: 'Any wrist lock or wrist lock variation should be tagged with this'
  },
  {
    id: 10004,
    name: 'leg-lock',
    description: 'Any leg lock or leg lock variation should be tagged with this'
  },
  {
    id: 10005,
    name: 'shoulder-lock',
    description: 'Any shoulder lock or shoulder lock variation should be tagged with this. Kimura, Americana, etc.'
  },
  {
    id: 10006,
    name: 'ankle-lock',
    description: 'Any ankle lock or ankle lock variation should be tagged with this'
  },
  {
    id: 10007,
    name: 'knee-bar',
    description: 'Any knee bar or knee bar variation should be tagged with this'
  },
  {
    id: 10008,
    name: 'toe-hold',
    description: 'Toe Hold'
  },
  {
    id: 10009,
    name: 'bow-and-arrow',
    description: 'Bow and Arrow Choke'
  },
  {
    id: 10010,
    name: 'ezekiel',
    description: 'Ezekiel Choke'
  },
  {
    id: 10011,
    name: 'rear-naked',
    description: 'Rear Naked Choke'
  },
  {
    id: 10012,
    name: 'bulldog',
    description: 'Bulldog Choke'
  },
  {
    id: 10013,
    name: 'collar-choke',
    description: 'Collar Choke'
  },
  {
    id: 10014,
    name: 'short-choke',
    description: 'Short Choke'
  },
  {
    id: 10015,
    name: 'baseball-choke',
    description: 'Baseball Bat Choke'
  },
  {
    id: 10016,
    name: 'darce',
    description: 'D\'arce Choke'
  },
  {
    id: 10017,
    name: 'bicep-slicer',
    description: 'Bicep Slicer'
  },
  {
    id: 10018,
    name: 'calf-slicer',
    description: 'Calf Slicer'
  },
  {
    id: 10019,
    name: 'clock-choke',
    description: 'Clock Choke'
  },
  {
    id: 10020,
    name: 'anaconda-choke',
    description: 'Anaconda Choke'
  },
  {
    id: 10021,
    name: 'peruvian-necktie',
    description: 'Peruvian Necktie'
  },
  {
    id: 10022,
    name: 'japanese-necktie',
    description: 'Japanese Necktie'
  },
  {
    id: 10023,
    name: 'loop-choke',
    description: 'Loop Choke'
  },
  {
    id: 10024,
    name: 'papercutter-choke',
    description: 'Papercutter Choke'
  },
  {
    id: 10025,
    name: 'footlock',
    description: 'Foot locks'
  },
  {
    id: 10026,
    name: 'arm-triangle',
    description: 'Arm Triangle'
  },
  {
    id: 10050,
    name: 'triangle',
    description: 'Any triangle or triangle variation should be tagged with this'
  },
  {
    id: 10051,
    name: 'heel-hook',
    description: 'Any heel hook or heel hook variation should be tagged with this'
  },
  {
    id: 10052,
    name: 'slicer',
    description: 'Any slicer or slicer variation should be tagged with this'
  },
  {
    id: 10053,
    name: 'crush',
    description: 'Any crush or crush variation should be tagged with this'
  },
  {
    id: 10054,
    name: 'chokes',
    description: 'any kind of choke'
  },
  {
    id: 10055,
    name: 'crucifix',
    description: 'yup, that one'
  },
  {
    id: 10056,
    name: 'bicep-crush',
    description: 'Bicep crush'
  },
  {
    id: 10057,
    name: 'calf-crush',
    description: 'Calf crush'
  },
  {
    id: 10058,
    name: 'omaplata',
    description: 'Omaplata'
  },
  {
    id: 10059,
    name: 'gogoplata',
    description: 'gogoplata'
  },
  {
    id: 10060,
    name: 'kimura',
    description: 'Kimura'
  },
  {
    id: 10061,
    name: 'americana',
    description: 'Americana'
  },
  {
    id: 10062,
    name: 'armbar',
    description: 'Armbar'
  },
  {
    id: 10063,
    name: 'north-south-choke',
    description: 'North South Choke'
  },
  {
    id: 10064,
    name: 'crank',
    description: 'all of the blood to the pain with all the pain to go with it'
  },
].each do |t|
  Tag.create!(
    id: t[:id],
    name: t[:name],
    description: t[:description],
    category: 'submission',
    created_at: initial_timestamp,
    updated_at: initial_timestamp
  )
end
