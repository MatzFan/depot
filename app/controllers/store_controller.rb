class StoreController < ApplicationController
  def index
    @products = Product.order(:title) # order all by product title
  end
end
