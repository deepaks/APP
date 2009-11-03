class AddVideoIdToPostContents < ActiveRecord::Migration
  def self.up
    add_column :post_contents, :video_id, :integer
  end

  def self.down
    remove_column :post_contents, :video_id
  end
end
