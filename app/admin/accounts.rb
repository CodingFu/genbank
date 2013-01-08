ActiveAdmin.register Account do     
  index do
    column :uid
    column :currency
    column :balance
    column :user
    default_actions                  
  end                                 

  filter :uid
  filter :user
  filter :currency                       

  form do |f|
    f.inputs "Account Details" do
      f.input :user
      f.input :currency, :as => :select, :collection => Account.currencies
      f.input :balance
    end                          
    f.actions                         
  end                                 
end                                   
