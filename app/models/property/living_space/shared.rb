module Property::LivingSpace
  module Shared
    extend ActiveSupport::Concern

    included do     
      field :shared, type: Boolean, default: false

      before_validation do
        if self.type == 'room'
          self.shared = true
        end
      end    

      alias_method :shared?, :shared

      # TODO:
      # classy_enum_field :shared
    end

    def shared= shared
      Property::LivingSpace::Size.configure_for shared
      write_attribute :shared, shared
    end
  end
end