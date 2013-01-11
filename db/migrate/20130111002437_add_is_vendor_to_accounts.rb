class AddIsVendorToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_vendor, :boolean
  end
end
