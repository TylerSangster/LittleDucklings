ActiveAdmin.register BlogPost do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :cover_photo, :title, :subtitle, :state, :body, :publisher, :published_at,  images: []
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
      row :cover_photo do
        if resource.cover_photo.present?
          link_to image_tag(resource.cover_photo, width: 300), resource.cover_photo, target: '_blank'
        else
          status_tag 'None'
        end
      end
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
      cover_photo = ['cover_photo image size should be 250:297 for best results.']
      cover_photo += if object.cover_photo.blank?
                          [br, content_tag(:span, 'No cover_photo Image Uploaded', class: 'status_tag no_image')]
                        else
                          [br, link_to(image_tag(object.cover_photo, width: 300), object.cover_photo, title: 'Click to see original', target: '_blank')]
                        end
      cover_photo = safe_join cover_photo
      

      f.input :cover_photo, as: :file, hint: cover_photo
      f.input :title
      f.input :subtitle
      f.input :publisher
      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published']

      f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
      f.input :body
    end
    f.actions
  end

  
end
