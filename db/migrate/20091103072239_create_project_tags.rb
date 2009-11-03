class CreateProjectTags < ActiveRecord::Migration
  def self.up
    create_table :project_tags do |t|
        t.string :tag_name
      t.timestamps
    end
  end

  def self.down
    drop_table :project_tags
  end
end
