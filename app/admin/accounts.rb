ActiveAdmin.register Account do     
  index do
    column :uid
    column :currency
    column :balance
    column :user
    column :alias
    column :comment_alias
    default_actions                  
  end                                 

  filter :uid
  filter :user
  filter :currency                       

  scope :all
  scope :vendor

  form do |f|
    f.inputs "Account Details" do
      f.input :user
      f.input :currency, :as => :select, :collection => Account.currencies
      f.input :balance
    end

    f.inputs "Vendor Accounts Settings" do
      f.input :is_vendor
      f.input :alias, :hint => "Vendor name for top menu"
      f.input :comment_alias, :label => "Comment field alias", :hint => "Label comment field for transactions"
      f.input :comment_hint, :label => "Comment field hint", :hint => "Hint for comment field for transactions"
      f.input :validation, :label => "Comment field validation regex", :hint => "Regexp to validate transaction (insert .* to allow anything)"
    end
    f.actions                         
  end                                 
end                                   
