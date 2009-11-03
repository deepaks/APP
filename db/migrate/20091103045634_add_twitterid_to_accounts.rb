class AddTwitteridToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :twitterid, :string
  end

  def self.down
    remove_column :accounts, :twitterid
  end
end
