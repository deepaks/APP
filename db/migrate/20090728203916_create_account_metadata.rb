class CreateAccountMetadata < ActiveRecord::Migration
  def self.up
    create_table :account_metadata do |t|
      t.integer :account_id
      t.string :meta_key
      t.string :meta_value

      t.timestamps
    end
  end

  def self.down
    drop_table :account_metadata
  end
end
