class CreateProjectTaggings < ActiveRecord::Migration
  def self.up
    create_table :project_taggings do |t|
        t.integer :project_id
        t.integer :project_tag_id
      t.timestamps
    end
  end

  def self.down
    drop_table :project_taggings
  end
end
