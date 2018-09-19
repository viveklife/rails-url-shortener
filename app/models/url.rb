class Url < ApplicationRecord
  POSTGRES_REGEX = '^(https?://)?(www\.)?'
  validates :original_url, presence: true, valid_url: true, on: :create
  after_validation :already_exists?
  before_create :assgin_short_url

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
    SecureRandom.alphanumeric.downcase
  end
end
