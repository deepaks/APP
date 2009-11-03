class AddProjectCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :project_count, :integer
  end

  def self.down
    remove_column :users, :project_count
  end
end
