class AddFeaturedToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :featured, :boolean, :default => 0
  end

  def self.down
    remove_column :pictures, :featured
  end
end
