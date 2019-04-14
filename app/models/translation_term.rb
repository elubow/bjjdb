class TranslationTerm < ApplicationRecord
  belongs_to :user

  validates :language, presence: true, length: {minimum: 2, maximum: 5}
  validates :body, presence: true, length: {maximum: 150}

  scope :base_terms, -> { where(base_term_id: 0) }



  LANGUAGES = {
    cs: 'Czech',
    da: 'Danish',
    de: 'German',
    en: 'English',
    es: 'Spanish',
    et: 'Estonian',
    fr: 'French',
    hu: 'Hungarian',
    id: 'Indonesian',
    is: 'Icelandic',
    it: 'Italian',
    ja: 'Japanese',
    nl: 'Dutch',
    'pt-BR': 'Portugeuse (Brazil)',
    'pt-PT': 'Portugeuse (Portugal)',
    pl: 'Polish',
    ro: 'Romanian',
    ru: 'Russian',
    tr: 'Turkish',
    uk: 'Ukranian',
    'zh-CN': 'Chinese (S)',
    'zh-TW': 'Chinese (Taiwan)',
  }

  def base_term
    TranslationTerm.find(self.base_term_id) unless self.base_term_id.zero?
  end

  def translation_counts
    TranslationTerm.where(base_term_id: self.id).count
  end

  def self.get_chart(dst)
    TranslationTerm.connection.select_all("SELECT t1.id AS src_id, t1.body AS src_body, t1.language AS src_language, t1.base_term_id AS src_base_term_id, t2.id AS dst_id, t2.body AS dst_body, t2.language AS dst_language, t2.base_term_id AS dst_base_term_id FROM translation_terms t1 LEFT OUTER JOIN translation_terms t2 ON (t1.id = t2.base_term_id) WHERE t1.language = 'en' AND (t2.language = '#{dst}') ORDER BY src_body").to_hash
  end
end
