class Url < ApplicationRecord
  POSTGRES_REGEX = '^(https?://)?(www\.)?'
  validates :original_url, presence: true, valid_url: true, on: :create
  before_validation :format_url
  after_validation :already_exists?
  before_create :assgin_short_url

  def format_url
    self.original_url = original_url&.strip&.downcase
  end

  def already_exists?
    if Url.where("REGEXP_REPLACE(original_url, '#{POSTGRES_REGEX}', '') = REGEXP_REPLACE('#{original_url}', '#{POSTGRES_REGEX}', '')").any?
      errors[:original_url] << 'already exists'
    end
  end

  def assgin_short_url
    self.short_url = generate_short_url
    self.short_url = generate_short_url while Url.exists?(short_url: short_url)
  end

  def generate_short_url
    SecureRandom.base58(10).downcase
  end
end
