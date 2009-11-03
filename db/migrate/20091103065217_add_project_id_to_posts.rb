class AddProjectIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :idea, :string
  end

  def self.down
    remove_column :posts, :idea
  end
end
