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

  def self.get_chart(src, dst)
    TranslationTerm.connection.select_all("SELECT en.id AS en_id, en.body AS en_body, en.base_term_id AS en_base_term_id, src.id AS src_id, src.body AS src_body, src.language AS src_language, src.base_term_id AS src_base_term_id, dst.id AS dst_id, dst.body AS dst_body, dst.language AS dst_language, dst.base_term_id AS dst_base_term_id
        FROM translation_terms en
                LEFT OUTER JOIN translation_terms src ON (en.id = src.base_term_id)
                LEFT OUTER JOIN translation_terms dst ON (en.id = dst.base_term_id)
       WHERE en.language = 'en' AND (src.language = '#{src}') AND (dst.language = '#{dst}')").to_hash
  end
end
