puts 'Creating Translation Terms'
TranslationTerm.create!(
  user_id: 42,
  base_term_id: 0,
  language: 'en',
  body: 'knee'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'knee', language: 'en').first.id,
  language: 'de',
  body: 'knie'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'knee', language: 'en').first.id,
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
  base_term_id: TranslationTerm.where(body: 'head', language: 'en').first.id,
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
  base_term_id: TranslationTerm.where(body: 'leg', language: 'en').first.id,
  language: 'fr',
  body: 'jambe'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'leg', language: 'en').first.id,
  language: 'de',
  body: 'bein'
)

TranslationTerm.create!(
  user_id: 42,
  base_term_id: TranslationTerm.where(body: 'mat', language: 'en').first.id,
  language: 'de',
  body: 'matte'
)
