class ChangeMetaValueToText < ActiveRecord::Migration
  def self.up
  change_column :account_metadata, :meta_value, :text
  end

  def self.down
  end
end



