class AddPictureIdToMediaSetsMedia < ActiveRecord::Migration
  def self.up
    add_column :media_sets_media, :picture_id, :integer
  end

  def self.down
    remove_column :media_sets_media, :picture_id
  end
end
