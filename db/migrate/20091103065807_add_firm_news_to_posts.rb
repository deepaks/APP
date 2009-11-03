class AddFirmNewsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :Firm_news, :string
  end

  def self.down
    remove_column :posts, :Firm_news
  end
end
