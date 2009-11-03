class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
        t.integer :account_id
        t.integer :credit_card_number
        t.string :paypal_user_name
        t.date :expiry_date
        t.integer :ammounts_paid
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
