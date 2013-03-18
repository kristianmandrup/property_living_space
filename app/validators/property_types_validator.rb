class PropertyTypesValidator < ActiveModel::EachValidator
  # implement the method called during validation
  def validate_each(record, attribute, value)
    return unless value
    value.each do |type|
      unless valid_property_types.include? type
        record.errors[attribute] << "must only contain valid property types"
      end
    end
  end

  protected

  def valid_property_types
    PropertyTypeValidator.valid_property_types
  end
end

