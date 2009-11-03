class CreateProfileInfos < ActiveRecord::Migration
  def self.up
    create_table :profile_infos do |t|
        t.string :location
        t.integer :year_founded
        t.integer :user_id
        t.integer :picture_id
      t.timestamps
    end
  end

  def self.down
    drop_table :profile_infos
  end
end
