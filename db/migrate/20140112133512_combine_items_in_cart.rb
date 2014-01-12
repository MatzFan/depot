class CombineItemsInCart < ActiveRecord::Migration

  def up # method to roll up duplicated line_items in the cart
    Cart.all.each do |cart| # iterate over every cart
      # next line is query to return a cart's line item quantities, grouped by product_id
      # will be an ordered list of pairs; [product_id, quantity]
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # here we remove any (duplicate) single products matching the product if quantity > 1
          cart.line_items.where(product_id: product_id).delete_all
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down # reverse of the above - for rollback
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
      # create relevant number of separate line items with quantity of 1
        LineItem.create cart_id: line_item.cart_id,
          product_id: line_item.product_id, quantity: 1
      end
      line_item.destroy # destroy record fro original line_item
    end
  end

end # of class
