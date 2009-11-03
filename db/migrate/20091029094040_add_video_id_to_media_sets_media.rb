class AddVideoIdToMediaSetsMedia < ActiveRecord::Migration
  def self.up
    add_column :media_sets_media, :video_id, :integer
  end

  def self.down
    remove_column :media_sets_media, :video_id
  end
end
