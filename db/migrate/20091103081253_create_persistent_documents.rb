class CreatePersistentDocuments < ActiveRecord::Migration
  def self.up
    create_table :persistent_documents do |t|
        t.integer :user_id
        t.string :firm_details
        t.string :bios
        t.string :mission_statement
      t.timestamps
    end
  end

  def self.down
    drop_table :persistent_documents
  end
end
