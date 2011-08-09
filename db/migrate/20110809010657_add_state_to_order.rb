class AddStateToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :state, :string, :default => '未发货'
  end

  def self.down
    remove_column :orders, :state
  end
end
