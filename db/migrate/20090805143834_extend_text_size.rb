class ExtendTextSize < ActiveRecord::Migration
  def self.up
    change_column :plaintexts, :body, :text
    change_column :account_metadata, :meta_value, :text
  end

  def self.down
    change_column :account_metadata, :meta_value, :string
    change_column :plaintexts, :body, :string
  end
end
