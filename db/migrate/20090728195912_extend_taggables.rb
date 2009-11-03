class ExtendTaggables < ActiveRecord::Migration
  def self.up
    add_column :accounts, :cached_tag_list, :string
    add_column :portfolios, :cached_tag_list, :string
    add_column :projects, :cached_tag_list, :string
    add_column :posts, :cached_tag_list, :string
  end

  def self.down
    remove_column :posts, :cached_tag_list
    remove_column :projects, :cached_tag_list
    remove_column :portfolios, :cached_tag_list
    remove_column :accounts, :cached_tag_list
  end
end
