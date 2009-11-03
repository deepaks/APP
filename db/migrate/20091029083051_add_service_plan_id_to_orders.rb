class AddServicePlanIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :service_plan_id, :integer
  end

  def self.down
    remove_column :orders, :service_plan_id
  end
end
