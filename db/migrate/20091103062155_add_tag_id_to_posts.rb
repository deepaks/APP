class AddTagIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :tag_id, :integer
  end

  def self.down
    remove_column :posts, :tag_id
  end
end
