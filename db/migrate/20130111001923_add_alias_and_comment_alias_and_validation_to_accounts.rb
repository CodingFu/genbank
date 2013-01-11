class AddAliasAndCommentAliasAndValidationToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :alias, :string
    add_column :accounts, :comment_alias, :string
    add_column :accounts, :validation, :string
  end
end
