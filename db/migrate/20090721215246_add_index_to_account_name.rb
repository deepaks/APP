class AddIndexToAccountName < ActiveRecord::Migration
  def self.up
    add_index :accounts, :name, :unique => true
  end

  def self.down
    remove_index :accounts, :name
  end
end
