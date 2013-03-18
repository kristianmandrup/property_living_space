module Property::LivingSpace
  module Size
    extend ActiveSupport::Concern

    included do
      field     :sqm,        type: Integer,  default: 0
      validates :sqm,        presence: true, inclusion:  {in: 6..500 }

      field     :sqfeet,     type: Integer,  default: 0
      validates :sqfeet,     presence: true, inclusion:  {in: 50..5000 }

      # TODO: add logic to choose prefered unit type of user?
      alias_method :size, :sqm
      alias_method :size=, :sqm=

      before_validation do
        unless size && size > 1
          self.size = default_size_for_type
        end
      end
    end

    def sqm= value
      super(value)
      write_attribute :sqfeet, sqm.to_sqfeet
      update_size if respond_to? :update_size
    end

    def sqfeet= value
      super(value)
      write_attribute :sqm, sqfeet.to_sqm
      update_size if respond_to? :update_size
    end

    protected

    def update_size
      # notify change of size! TODO: Use observer pattern?
      update_cost_sqm if respond_to? :update_cost_sqm
      update_cost_sqfeet if respond_to? :update_cost_sqfeet
    end

    def default_size_for_type
      clazz = Property::Size
      self.respond_to?(:type) ? clazz.default_for(type) : clazz.default_value
    end          

    module ClassMethods
      def default_value
        60
      end

      def default_for type = :house
        case type.to_sym
        when :room
          10
        when :apartment
          60
        when :house
          130
        when :villa
          200
        else
          default_value
        end
      end 
      alias_method :default_for_type, :default_for

      def configure_for shared
        sizes type_of_living(shared)
      end

      def type_of_living shared
        shared == true ? :one_room : :other
      end

      def sizes living = :other, unit = :meter
        case living
        when :one_room
          [6..10, 10..16, 16..24, 25..40]
        else
          [6..20, 20..40, 40..60, 60..90, 90..120, 120..200, 200..300, 300..500]
        end
      end
    end
    extend ClassMethods    
  end
end