class AddPostTextToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :post_text, :string
  end

  def self.down
    remove_column :posts, :post_text
  end
end
