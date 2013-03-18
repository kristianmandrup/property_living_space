class FurnishedValidator < ActiveModel::EachValidator
  # implement the method called during validation
  def validate_each(record, attribute, value)
    return unless value
    unless valid_furnished.include? value
      record.errors[attribute] << "must be one of either #{valid_furnished}, was: #{value}"
    end
  end

  protected

  def valid_furnished
    ['furnished', 'unfurnished']
  end
end

