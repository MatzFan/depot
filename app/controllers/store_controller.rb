class StoreController < ApplicationController
  def index
    @products = Product.order(:title) # order by product title
  end
end
