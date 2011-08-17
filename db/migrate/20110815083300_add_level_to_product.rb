class AddLevelToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :level, :float, :default=>0.0
  end

  def self.down
    remove_column :products, :level
  end
end
