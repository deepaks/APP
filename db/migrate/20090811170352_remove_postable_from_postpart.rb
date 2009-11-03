class RemovePostableFromPostpart < ActiveRecord::Migration
  def self.up
    remove_column :post_parts, :postable_id
    remove_column :post_parts, :postable_type
  end

  def self.down
    add_column :post_parts, :postable_type, :string
    add_column :post_parts, :postable_id, :integer
  end
end
