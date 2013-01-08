class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :money_transactions

      t.timestamps
    end
  end
end
