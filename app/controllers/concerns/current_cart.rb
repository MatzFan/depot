module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      @cart = Cart.find(session[:cart_id]) # this is how Rails stores a seesion - as a Hash
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id # sets param for this cart in a cookie
    end

end # of module
