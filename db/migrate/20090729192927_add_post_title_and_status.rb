class AddPostTitleAndStatus < ActiveRecord::Migration
  def self.up
    add_column :posts, :title, :string
    add_column :posts, :status, :string
  end

  def self.down
    remove_column :posts, :status
    remove_column :posts, :title
  end
end
