ActiveAdmin.register BlogPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :state, :body, :publisher, :published_at,  images: []
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
    column :title
    column :slug
    column :state
    column :publisher
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :subtitle
      row :state
      row :slug
      row :publisher
      row :body
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'BlogPost Details' do
      f.input :title
      f.input :subtitle
      f.input :slug
      f.input :publisher


      
      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published'],
              input_html: { class: '' }
      f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
    end
    f.actions
  end

  
end
