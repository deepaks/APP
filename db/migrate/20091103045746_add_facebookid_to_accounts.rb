class AddFacebookidToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :facebookid, :string
  end

  def self.down
    remove_column :accounts, :facebookid
  end
end
