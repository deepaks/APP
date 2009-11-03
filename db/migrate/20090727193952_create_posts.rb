class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :project_id
      t.string :postable_type
      t.integer :postable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
