class CreatePlaintexts < ActiveRecord::Migration
  def self.up
    create_table :plaintexts do |t|
      t.string :body
      t.timestamps
    end
  end

  def self.down
    drop_table :plaintexts
  end
end
