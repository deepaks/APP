class AddFieldsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :title, :string
    add_column :projects, :location, :string
    add_column :projects, :reference_code, :string
    add_column :projects, :user_id, :integer
    add_column :projects, :credits, :integer
    add_column :projects, :date, :datetime
    add_column :projects, :description, :string
  end

  def self.down
    remove_column :projects, :title
    remove_column :projects, :location
    remove_column :projects, :reference_code
    remove_column :projects, :user_id
    remove_column :projects, :credits
    remove_column :projects, :date
    remove_column :projects, :description
  end
end
