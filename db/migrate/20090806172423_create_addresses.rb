class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.integer :zip
      t.string :city
      t.string :state
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type
      
			t.references :addressable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
