class ExtendProjectAndPost < ActiveRecord::Migration
  def self.up
    add_column :projects, :account_id, :integer
    add_column :posts, :account_id, :integer
  end

  def self.down
    remove_column :posts, :account_id
    remove_column :projects, :account_id
  end
end
