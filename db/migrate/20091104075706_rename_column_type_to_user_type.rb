class RenameColumnTypeToUserType < ActiveRecord::Migration
  def self.up
    rename_column :user_types, :type, :user_type
  end

  def self.down
  end
end
