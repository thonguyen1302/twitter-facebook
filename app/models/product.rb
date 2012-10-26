class Product < ActiveRecord::Base
  attr_accessible :image, :description, :image_url, :price, :title
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  #...

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
	   return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
   end

  # search product by title
  searchable do
    text :title

    string :publish_month
  end



def publish_month
  
end






end
