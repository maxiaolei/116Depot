class AddPdfToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :pdf, :string, :default => 'lack'
  end

  def self.down
    remove_column :products, :pdf
  end
end
