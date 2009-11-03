class AddTitleToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :title, :string
    add_column :accounts, :tag_line, :text
    add_column :accounts, :email, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :fax, :string
    add_column :accounts, :timezone, :string
  end

  def self.down
    remove_column :accounts, :timezone
    remove_column :accounts, :fax
    remove_column :accounts, :phone
    remove_column :accounts, :email
    remove_column :accounts, :tag_line
    remove_column :accounts, :title
  end
end
