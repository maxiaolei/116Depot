class CreateStarRates < ActiveRecord::Migration
  def self.up
    create_table :star_rates do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :star_rates
  end
end
