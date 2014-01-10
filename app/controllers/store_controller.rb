class StoreController < ApplicationController
  def index
    @products = Product.order(:title) # order all by product title
    puts @products.inspect
  end
end
