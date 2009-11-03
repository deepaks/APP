class AddPostIdToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :post_id, :integer
  end

  def self.down
    remove_column :pictures, :post_id
  end
end
