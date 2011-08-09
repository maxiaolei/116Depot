class CreateBookInNeeds < ActiveRecord::Migration
  def self.up
    create_table :book_in_needs do |t|
      t.string :title
      t.string :author
      t.string :press
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :book_in_needs
  end
end
