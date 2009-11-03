class CreatePostContents < ActiveRecord::Migration
  def self.up
    create_table :post_contents, :id => :false do |t|
      t.integer :post_part_id
      t.references :content, :polymorphic => {:default => :Plaintext}
      t.timestamps
    end
  end

  def self.down
    drop_table :post_contents
  end
end
