class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :portfolios_projects do |t|
      t.integer :portfolio_id
      t.integer :project_id

      t.timestamps
    end
  end
  
  def self.down
    drop_table :portfolios_projects
    drop_table :projects
  end
end
