class CleanProjectsPortfoliosTable < ActiveRecord::Migration
  def self.up
    remove_column :portfolios_projects, :updated_at
    remove_column :portfolios_projects, :created_at
    remove_column :portfolios_projects, :id
  end

  def self.down
    add_column :portfolios_projects, :id, :integer
    add_column :portfolios_projects, :created_at, :timestamp
    add_column :portfolios_projects, :updated_at, :timestamp
  end
end
