module Property::LivingSpace
  module Furnishment
    extend ActiveSupport::Concern

    included do
      field     :furnishment,   type: String,   default: Property::Furnishment.default_value      
      validates :furnishment,   presence: true, inclusion:  {in: Property::Furnishment.valid_values }
    end

    def furnished= value
      self.furnishment = value == true ? 'furnished' : 'unfurnished'
    end

    def furnished?
      furnishment == 'furnished'
    end

    def unfurnished?
      !furnished?
    end


    class << self
      def valid_values
        ['unfurnished', 'furnished']
      end

      def default_value
        valid_values.first
      end
    end
  end
end
    