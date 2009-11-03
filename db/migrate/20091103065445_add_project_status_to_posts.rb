class AddProjectStatusToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :project_status, :string
  end

  def self.down
    remove_column :posts, :project_status
  end
end
