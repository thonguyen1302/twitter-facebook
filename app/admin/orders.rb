ActiveAdmin.register Order do
  
  
  index do
    column :name
    column :address
    column :email
    column :pay_type
    
    default_actions
  end
end
