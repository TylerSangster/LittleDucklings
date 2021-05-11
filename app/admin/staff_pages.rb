ActiveAdmin.register StaffPage do
  
  # permit_params 
  permit_params do
    binding.pry
    permitted = [:name, :cover_photo, :body, :state, :slug, :location, :published_at, :content]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  # find record with slug(friendly_id)
  controller do
    def find_resource
      # binding.pry
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  index do
    id_column
    column :cover_photo
    column :name
    column :slug
    column :state
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :cover_photo do |page|
        image_tag page.cover_photo if page.cover_photo.present?
      end
      row :name
      row :body

      row :state
      row :slug
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Staff Page Details' do
      f.file_field :cover_photo
      f.input :name
      f.input :body, as: :action_text
      f.input :content, as: :action_text
      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published']
       # f.input :published_at
      f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
    end
    f.actions
  end

  
end
