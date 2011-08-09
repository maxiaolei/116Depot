class AddPriceToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :price, :float, :default => 0.0
  end

  def self.down
    remove_column :orders, :price
  end
end
