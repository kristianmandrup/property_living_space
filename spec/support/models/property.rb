class Property
  include Mongoid::Document

  # alias shortcuts
  Details       = LivingSpace::Details
  Furnishment   = LivingSpace::Furnishment  
  Rooms         = LivingSpace::Rooms
  Size          = LivingSpace::Size
  Shared        = LivingSpace::Shared
  Type          = LivingSpace::Type

  include_concerns  :living_space

  field :name
end