module Property::LivingSpace
  module Type
    extend ActiveSupport::Concern

    included do
      field     :type,   type: String,   default: Property::Type.default_value
      
      validates :type,   presence: true, inclusion:  {in: Property::Type.valid_values }
    end

    def room?
      type == 'room'
    end

    def default_for_type attribute
      meth = "default_#{attribute}_for_type"
      raise ArgumentError, "No LivingSpace attribute: #{attribute}" unless respond_to? meth
      send meth 
    end

    class << self
      def valid_values
        ['apartment', 'room', 'loft', 'house', 'villa', 'house boat']
      end

      def default_value
        valid_values.first
      end
    end
  end
end
    