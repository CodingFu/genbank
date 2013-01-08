ActiveAdmin.register User do     
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  show do |user|
    attributes_table do
      row :email
      row :current_sign_in_at        
      row :last_sign_in_at           
      row :sign_in_count             
    end
    h2 "User accounts"
    user.accounts.each do |account|
      div do
        a account.name, :href => "/admin/accounts/#{account.id}"
      end
    end
  end
  form do |f|                         
    f.inputs "User Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
