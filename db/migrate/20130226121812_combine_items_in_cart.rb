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
    LineItem.where("quantity > 1").each do |lineitem|
      #create items qith quantity 1
      lineitem.quantity.times do
        LineItem.create :cart_id => lineitem.cart_id,
                        :product_id => lineitem.product_id,
                        :quantity => 1
      end

      #remove original
      lineitem.destroy
    end
  end

end
