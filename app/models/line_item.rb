class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id

  belongs_to :product
  #override error used by LineItemsController#create : Can't mass-assign protected attributes
  attr_accessible :product
  attr_accessible :quantity
  belongs_to :cart
end
