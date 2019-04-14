puts 'Creating Translation Terms'
TranslationTerm.create!(
  id: 1,
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'knee'
)

TranslationTerm.create!(
  id: 2,
  user_id: 42,
  base_term_id: 1,
  language: 'de',
  body: 'knie'
)

TranslationTerm.create!(
  id: 3,
  user_id: 42,
  base_term_id: 1,
  language: 'fr',
  body: 'genou'
)

TranslationTerm.create!(
  id: 4,
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'head'
)

TranslationTerm.create!(
  id: 5,
  user_id: 42,
  base_term_id: 4,
  language: 'de',
  body: 'kopf'
)

TranslationTerm.create!(
  id: 6,
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'mats'
)
