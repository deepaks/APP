class CreatePostLinks < ActiveRecord::Migration
  def self.up
    create_table :post_links do |t|
        t.string :link
        t.integer :post_id
      t.timestamps
    end
  end

  def self.down
    drop_table :post_links
  end
end
