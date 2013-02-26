class CombineItemsInCart < ActiveRecord::Migration
  def up
  	#replace multiple items for a single product in a cart with single item
  	Cart.all.each do |cart|
  		sums = cart.line_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			#remove individual items
  			cart.line_items.where(:product_id => product_id).delete_all
  			#replace with sum
  			cart.line_items.create(:product_id => product_id, :quantity => quantity)
  		end
  	end
  end

  def down
  end
end
