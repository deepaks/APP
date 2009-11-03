class CreateKeyMembers < ActiveRecord::Migration
  def self.up
    create_table :key_members do |t|
        t.integer :user_id
        t.string :staff_name
      t.timestamps
    end
  end

  def self.down
    drop_table :key_members
  end
end
