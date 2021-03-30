ActiveAdmin.register StaffPage do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :state, :body, :publisher, :published_at
  # find record with slug(friendly_id)
    controller do
      def find_resource
        begin
          scoped_collection.where(slug: params[:id]).first!
        rescue ActiveRecord::RecordNotFound
          scoped_collection.find(params[:id])
        end
      end
    end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :state, :image_path, :publisher, :published_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end