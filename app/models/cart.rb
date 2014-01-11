class Cart < ActiveRecord::Base
  # ensure when cart is destroyed, so are its line_items
  has_many :line_items, dependent: :destroy
end
