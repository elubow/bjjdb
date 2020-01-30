class Review < ApplicationRecord
  belongs_to :user
  belongs_to :gym

  monetize :drop_in_fee_cents, allow_nil: true

  validates :stars, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :roll_type, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  # I hate that I have to do this
  before_save :clean_languages
  before_save :clean_tags

  def self.currency_codes
    currencies = []
    Money::Currency.table.values.each do |currency|
      currencies = currencies + [[currency[:name] + ' (' + currency[:iso_code] + ')', currency[:iso_code]]]
    end
    currencies.sort
  end

  Languages = [
    "Abkhazian",
    "Afar",
    "Afrikanns",
    "Albanian",
    "Amharic",
    "Arabic",
    "Armenian",
    "Assamese",
    "Aymara",
    "Azerbaijani",
    "Bashkir",
    "Basque",
    "Bengali, Bangla",
    "Bhutani",
    "Bihari",
    "Bislama",
    "Breton",
    "Bulgarian",
    "Burmese",
    "Byelorussian",
    "Cambodian",
    "Catalan",
    "Chinese (Mandarin)",
    "Corsican",
    "Croation",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Esperanto",
    "Estonian",
    "Faeroese",
    "Fiji",
    "Finnish",
    "Flemish",
    "French",
    "Frisian",
    "Gaelic (Scots Gaelic)",
    "Galician",
    "Georgian",
    "German",
    "Greek",
    "Greenlandic",
    "Guarani",
    "Gujarati",
    "Hausa",
    "Hebrew",
    "Hindi",
    "Hungarian",
    "Icelandic",
    "Indonesian",
    "Interlingua",
    "Interlingue",
    "Inupiak",
    "Irish",
    "Italian",
    "Japanese",
    "Javanese",
    "Kannada",
    "Kashmiri",
    "Kazakh",
    "Kinyarwanda",
    "Kirghiz",
    "Kirundi",
    "Korean",
    "Kurdish",
    "Laothian",
    "Latin",
    "Latvian, Lettish",
    "Lingala",
    "Lithuanian",
    "Macedonian",
    "Malagasy",
    "Malay",
    "Malayalam",
    "Maltese",
    "Maori",
    "Marathi",
    "Moldavian",
    "Mongolian",
    "Nauru",
    "Nepali",
    "Norwegian",
    "Occitan",
    "Oriya",
    "Oromo, Afan",
    "Pashto, Pushto",
    "Persian",
    "Polish",
    "Portuguese",
    "Punjabi",
    "Quechua",
    "Rhaeto-Romance",
    "Romanian",
    "Russian",
    "Samoan",
    "Sangro",
    "Sanskrit",
    "Serbian",
    "Serbo-Croatian",
    "Sesotho",
    "Setswana",
    "Shona",
    "Sindhi",
    "Singhalese",
    "Siswati",
    "Slovak",
    "Slovenian",
    "Somali",
    "Spanish",
    "Sudanese",
    "Swahili",
    "Swedish",
    "Tagalog",
    "Tajik",
    "Tamil",
    "Tatar",
    "Telugu",
    "Thai",
    "Tibetan",
    "Tigrinya",
    "Tonga",
    "Tsonga",
    "Turkish",
    "Turkmen",
    "Twi",
    "Ukranian",
    "Urdu",
    "Uzbek",
    "Vietnamese",
    "Volapuk",
    "Welsh",
    "Wolof",
    "Xhosa",
    "Yiddish",
    "Yoruba",
    "Zulu"
  ].freeze

  Tags = [
    'gi',
    'nogi',
    'gi color requirement',
    'family friendly',
    'drop in friendly',

    'hobbyist gym',
    'competition gym',
    'traditional gym',

    'shower',
    'changing room',

    'leglock friendly'
  ].freeze

  def pretty_languages
    rv = []
    self.languages.each do |l|
      rv << Languages[l]
    end
    rv
  end

  private

    def clean_languages
      self.languages = self.languages.delete_if {|lng|  lng.empty?}
    end

    def clean_tags
      self.tags = self.tags.delete_if {|tag|  tag.empty?}
    end
end
