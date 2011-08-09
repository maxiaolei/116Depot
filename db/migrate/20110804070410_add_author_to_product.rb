class AddAuthorToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :author, :string
  end

  def self.down
    remove_column :products, :author
  end
end
