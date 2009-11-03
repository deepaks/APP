class CreatePostParts < ActiveRecord::Migration
  def self.up
    create_table :post_parts do |t|
      t.integer :post_id
      t.string :postable_type
      t.integer :postable_id
      t.integer :position

      t.timestamps
    end
    
    remove_column :posts, :postable_id
    remove_column :posts, :postable_type
    
  end

  def self.down
    add_column :posts, :postable_type, :string
    add_column :posts, :postable_id, :integer
    
    drop_table :post_parts
  end
end
