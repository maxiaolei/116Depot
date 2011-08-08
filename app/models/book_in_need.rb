class BookInNeed < ActiveRecord::Base
  validates :title, :author,:press,:description, :image_url, :presence => true
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with        => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPC or PNG image.'
  }
end
