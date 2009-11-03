class AddPictureIdToPostContents < ActiveRecord::Migration
  def self.up
    add_column :post_contents, :picture_id, :integer
  end

  def self.down
    remove_column :post_contents, :picture_id
  end
end
