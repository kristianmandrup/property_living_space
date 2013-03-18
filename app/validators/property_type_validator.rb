class PropertyTypeValidator < ActiveModel::EachValidator
  # implement the method called during validation
  def validate_each(record, attribute, value)
    unless valid_property_types.include? value
      record.errors[attribute] << "must be a valid property type, one of: #{valid_property_types}, was: #{value}"
    end
  end

  def self.valid_property_types
    ['apartment', 'house', 'villa', 'room', 'house boat']
  end

  protected

  def valid_property_types
    PropertyTypeValidator.valid_property_types
  end
end

