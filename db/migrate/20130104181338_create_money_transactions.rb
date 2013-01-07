class CreateMoneyTransactions < ActiveRecord::Migration
  def change
    create_table :money_transactions do |t|
      t.integer :from_id
      t.integer :to_id
      t.decimal :amount, precision: 14, scale: 2
      t.string :comment

      t.timestamps
    end
  end
end
