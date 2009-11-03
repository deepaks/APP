class CreateMediaSetsMedia < ActiveRecord::Migration
  def self.up
    create_table :media_sets_media, :id => :false do |t|
      t.integer :media_set_id
      t.references :medium, :polymorphic => :true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :media_sets_media
  end
end
