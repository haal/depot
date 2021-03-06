class Product < ActiveRecord::Base

  attr_accessible :description, :image_url, :price, :title, :locale

  default_scope :order => 'title'

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  has_many :orders, :through => :line_items

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum => 10, :too_short => "Please enter at least 10 characters"}
  validates :image_url, :format => {
  	:with => %r{\.(gif|jpg|png)$}i,
  	:message => 'must be a URL for GIF, JPG or PNG image.'
  }

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
   if line_items.empty?
    return true
   else
    errors.add(:base, 'Line Items present')
    return false
   end
  end

  def self.find_product_for_sale
    where(:locale => I18n.locale)
  end

end
