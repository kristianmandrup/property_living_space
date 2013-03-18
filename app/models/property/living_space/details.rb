module Property::LivingSpace
  module Details
    extend ActiveSupport::Concern

    # include_concerns :rooms

    included do
      field :year_built,      type: DateTime

      # can also index attributes in embedded models !!!
      # search_in :title, :description #, :tags => :name, :category => :name      
    end

    def configure_details      
    end    
  end
end


