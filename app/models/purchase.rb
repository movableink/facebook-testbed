class Purchase < ActiveRecord::Base
  attr_accessible :product_id, :user_id
end
