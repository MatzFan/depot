class Cart < ActiveRecord::Base
  # ensure when cart is destroyed, so are its line_items
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    # find_by returns an existing item from Db or nil - like 'if exists'
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      # quantity is now an attribute of line_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    # use Rails Array::sum method
    line_items.to_a.sum { |item| item.total_price }
  end

end # of class
