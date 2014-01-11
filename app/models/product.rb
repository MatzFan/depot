class Product < ActiveRecord::Base
  has_many :line_items

  # Hook method needed so we can't destroy a product if it is in a basket!
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  def self.latest # class method to return latest version of a product
    # Rails method 'updated_at' is timestamp, this orders by that so latest returned
    Product.order(:updated_at).last
  end

  private

    def ensure_not_referenced_by_any_line_item
      if self.line_items.empty?
        return true
      else
        # errors accessible. Can associate with an attribute (field) or base object(here)
        errors.add(:base, "Can't destroy; Line Items present for this product")
        return false
      end
    end

end # of class
