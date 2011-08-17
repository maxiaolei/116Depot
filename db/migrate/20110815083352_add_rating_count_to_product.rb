class AddRatingCountToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :rating_count, :integer, :default=>0
  end

  def self.down
    remove_column :products, :rating_count
  end
end
