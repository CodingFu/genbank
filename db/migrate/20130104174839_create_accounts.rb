class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :currency
      t.decimal :balance, precision: 14, scale: 2, default: 0.0
      t.string :uid
      t.integer :user_id

      t.timestamps
    end

    add_index :accounts, :uid
  end
end
