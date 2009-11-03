class CreateMediaSets < ActiveRecord::Migration
  def self.up
    create_table :media_sets do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :media_sets
  end
end
