ActiveAdmin.register StaffPage do

  permit_params :name, :body, :state, :slug, :location, :published_at,  images: []
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

  index do
    id_column
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
      row :name
      row :body
      row :body do |page|
        page.body.html_safe
      end 
      row :state
      row :slug
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Staff Page Details' do
      f.input :name
      f.input :body, as: :froala_editor
      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published']
      f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
    end
    f.actions
  end

  
end
