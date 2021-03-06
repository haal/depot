class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id

  belongs_to :product
  #override error used by LineItemsController#create : Can't mass-assign protected attributes
  attr_accessible :product, :quantity, :price, :cart
  belongs_to :cart
  belongs_to :order

  def total_price
  	product.price * quantity
  end

end
