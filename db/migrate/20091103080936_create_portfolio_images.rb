class CreatePortfolioImages < ActiveRecord::Migration
  def self.up
    create_table :portfolio_images do |t|
        t.integer :portfolio_id
        t.integer :project_id
        t.integer :picture_id
      t.timestamps
    end
  end

  def self.down
    drop_table :portfolio_images
  end
end
