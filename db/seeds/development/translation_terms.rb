puts 'Creating Translation Terms'
TranslationTerm.create!(
  id: 1,
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'knee'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'knee'),
  language: 'de',
  body: 'knie'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'knee'),
  language: 'fr',
  body: 'genou'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'head'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'head'),
  language: 'de',
  body: 'kopf'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'mats'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'leg'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'leg'),
  language: 'fr',
  body: 'jambe'
)
