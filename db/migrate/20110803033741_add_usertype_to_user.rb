class AddUsertypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :usertype, :integer, :default => 2
  end

  def self.down
    remove_column :users, :usertype
  end
end
