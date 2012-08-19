class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price

  has_many :purchases
  has_many :users, :through => :purchases
end
