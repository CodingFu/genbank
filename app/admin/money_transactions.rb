ActiveAdmin.register MoneyTransaction do     
  index do
    column :id
    column :created_at
    column :from
    column :to
    column :amount
  end                                 

  filter :from
  filter :to                       

  form do |f|
    f.actions                         
  end                                 
end                                   
