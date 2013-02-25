class StoreController < ApplicationController
  def index
  	@products = Product.all
  	@time = Time.current
  end
end
