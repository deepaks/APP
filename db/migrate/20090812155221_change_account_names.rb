class ChangeAccountNames < ActiveRecord::Migration
  def self.up
    rename_column(:accounts, :name, :domain_name)
    rename_column(:accounts, :display_name, :firm_name)
  end

  def self.down
    rename_column(:accounts, :domain_name, :name)
    rename_column(:accounts, :firm_name, :display_name)
  end
end
