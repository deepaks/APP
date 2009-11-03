class AddFieldsToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :title, :string
    add_column :portfolios, :text, :string
    add_column :portfolios, :user_id, :integer
  end

  def self.down
    remove_column :portfolios, :title
    remove_column :portfolios, :text
    remove_column :portfolios, :user_id
  end
end
