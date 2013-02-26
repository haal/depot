class AddPriceToLineItem < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal

    #copy price from product to line item
    LineItem.all.each do |lineitem|
    	lineitem.price = lineitem.product.price
    end

  end

  def down
  	remove_column :line_items, :price
  end
end
