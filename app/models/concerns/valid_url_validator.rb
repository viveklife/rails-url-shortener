class ValidUrlValidator < ActiveModel::EachValidator
  VALID_REGEX = /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/i
  def validate_each(record, attribute, value)
    unless VALID_REGEX.match?(value)
      record.errors[attribute] << (options[:message] || 'invalid URL')
    end
  end
end