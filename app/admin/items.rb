ActiveAdmin.register Item do
  menu parent: 'Menu'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :item_type, :ingredients, :description, :menu_id, :type
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :item_type, :ingredients, :description, :menu_id, :type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
