class CreateServicePlans < ActiveRecord::Migration
  def self.up
    create_table :service_plans do |t|
      t.string :plan_type
      t.float :price
      t.text :feature_description

      t.timestamps
    end
  end

  def self.down
    drop_table :service_plans
  end
end
