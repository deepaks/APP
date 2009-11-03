class AddAccountIdToServicePlans < ActiveRecord::Migration
  def self.up
    add_column :service_plans, :account_id, :integer
  end

  def self.down
    remove_column :service_plans, :account_id
  end
end
