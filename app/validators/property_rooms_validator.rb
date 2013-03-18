class PropertyRoomsValidator < ActiveModel::Validator
  attr_accessor :doc

  def validate(doc)
    @doc = doc
    self.class.room_types.each do |room_type|
      send "check_#{room_type}" if doc.respond_to? room_type
    end
  end

  def self.room_types
    [:bedrooms, :bathrooms]
  end

  protected

  room_types.each do |room_type|
    define_method "check_#{room_type}" do
      send "#{room_type}_nil_error" if doc.send(room_type).nil?

      send("#{room_type}_error") if doc.send(room_type) >= (doc.rooms || 0)
    end

    define_method "#{room_type}_error" do
      msg = "Property can't have more #{room_type}s (#{doc.send(room_type)}) than rooms (#{doc.rooms}"
      doc.errors[room_type] << msg
    end

    define_method "#{room_type}_nil_error" do
      msg = "Property #{room_type} must not be bil"
      doc.errors[room_type] << msg
    end
  end

  def error doc, msg
    doc.errors[:base] << msg
  end
end