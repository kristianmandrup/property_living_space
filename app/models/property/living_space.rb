class Property
  module LivingSpace
    extend ActiveSupport::Concern

    include_concerns :details, :rooms, :shared, :size, :type, :furnishment

    included do        
    end
  end
end