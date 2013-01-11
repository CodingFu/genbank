class AddCommentHintToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :comment_hint, :string
  end
end
