class StoreController < ApplicationController
  include CurrentCart # provides access to @cart
  before_action :set_cart
  def index
    @products = Product.order(:title) # order all by product title
  end
end
