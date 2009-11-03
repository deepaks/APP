class AssocPostTypesToAccount < ActiveRecord::Migration
  def self.up
    add_column :plaintexts, :account_id, :integer
    add_column :pictures, :account_id, :integer
    add_column :videos, :account_id, :integer
  end

  def self.down
    remove_column :videos, :account_id
    remove_column :pictures, :account_id
    remove_column :plaintexts, :account_id
  end
end
