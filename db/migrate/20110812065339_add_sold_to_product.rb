class AddSoldToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :sold, :integer, :default => 0
  end

  def self.down
    remove_column :products, :sold
  end
end
