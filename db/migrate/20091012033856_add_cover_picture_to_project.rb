class AddCoverPictureToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :cover_picture_id, :integer
  end

  def self.down
    remove_column :projects, :cover_picture_id
  end
end
