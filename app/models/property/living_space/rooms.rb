module Property::LivingSpace
  module Rooms
    extend ActiveSupport::Concern

    included do     
      field :rooms,       type: Integer, default: 0
      field :bedrooms,    type: Integer, default: 1
      field :bathrooms,   type: Integer, default: 1

      validates :rooms,       presence: true, inclusion:  {in: 1..12 }
      validates :bedrooms,    presence: true, inclusion:  {in: 1..8 }
      validates :bathrooms,   presence: true, inclusion:  {in: 1..4 }

      validate :bedroom_count, :bathroom_count

      before_validation do
        unless rooms && rooms > 1
          self.rooms = default_rooms_for_type
        end

        if respond_to?(:type) && type == 'room'
          self.bedrooms = 1
        end

        self.bedrooms  = rooms if bedrooms > rooms
        self.bathrooms = rooms if bathrooms > rooms
      end      
    end

    class << self
      def default_value
        2
      end

      def default_for type = :house
        case type.to_sym
        when :room
          1
        when :apartment
          2
        when :house
          3
        when :villa
          4
        else
          default_value
        end
      end
      alias_method :default_for_type, :default_for
    end

    def default_rooms_for_type
      clazz = Property::Rooms
      self.respond_to?(:type) ? clazz.default_for(type) : clazz.default_value
    end      

    protected

    def bedroom_count
      errors.add(:bedrooms, "must not be more than # of rooms") unless bedrooms <= rooms
    end

    def bathroom_count
      errors.add(:bathrooms, "must not be more than # of rooms") unless bathrooms <= rooms
    end
  end
end