class AddFeaturedToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :featured, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :featured
  end
end
