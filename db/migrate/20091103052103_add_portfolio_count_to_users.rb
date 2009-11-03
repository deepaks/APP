class AddPortfolioCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :portfolio_count, :integer
  end

  def self.down
    remove_column :users, :portfolio_count
  end
end
