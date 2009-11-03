class AddPostIdToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :post_id, :integer
  end

  def self.down
    remove_column :videos, :post_id
  end
end
