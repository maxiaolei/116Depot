class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  
  PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]
  
  validates :name, :address, :email, :pay_type, :presence => true
  validates_length_of :name,:maximum=>50,:message=>"is  too long"
  validates_length_of :address,:maximum=>200,:message=>"is too long"
  validates_length_of :email,:maximum=>100,:message=>"is too long"
  validates :email, :format => {
    :with    => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => I18n.t('.invalid_email')
  }
  validates :pay_type, :inclusion => PAYMENT_TYPES
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
    cart.total_price
  end
  
end
