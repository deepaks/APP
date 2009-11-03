class ExtendAccountModel < ActiveRecord::Migration
  def self.up
    add_column :accounts, :display_name, :string
  end

  def self.down
    remove_column :accounts, :display_name
  end
end
