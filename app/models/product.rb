class Product < ActiveRecord::Base
validates :title, :description, :image_url, :presence => true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
validates :title, :uniqueness => true
validates_length_of :description,:minimum=>1,:message=>"is too short"
validates_length_of :title,:maximum=>50,:message=>" is too long"
validates_length_of :author,:maximum=>50,:message=>" is too long"
validates :image_url, :format =>{
	:with      => %r{\.(gif|jpg|png)$}i,
	:message   => I18n.t('.invalid_imag')
}

CATEGORY_TYPES = ["Software", "Hardware", "Literature", "Philothephy"]

default_scope :order => 'title'

has_many :line_items
has_many :orders, :through => :line_items
has_many :comments

before_destroy :ensure_not_referenced_by_any_line_item

# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
  if line_items.count.zero?
    return true
  else
    errors[:base] << "Line Items present"
    return false
  end
end
end
