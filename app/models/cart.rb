class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_product(product_id, cart_id)
  	current_item = line_items.where(:product_id => product_id).first
  	if current_item
  		current_item.quantity += 1
  	else
  		current_item = LineItem.new(:product_id => product_id, :cart_id => cart_id)
  	end
    puts "++++++++In add product cart is: #{current_item.cart}"
  	current_item
  end

end
