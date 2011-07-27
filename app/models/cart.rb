class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
<<<<<<< HEAD

  def add_product(product_id)
    current_item = line_items.where(:product_id=>product_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id => product_id)
      line_items << current_item
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.sum(:quantity)
  end
end
=======
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end
  def total_price
    line_items.to_a.sum {|item| item.total_price }
  end
end
>>>>>>> 3ae876a4685c17aafb9b3e9b3e7c806d0b111c2f
