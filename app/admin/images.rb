ActiveAdmin.register Image do
  permit_params :title, :image, :state, :slug, :location, :published_at
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
    column :state
    column :published_at
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :image do
        if resource.image.present?
          link_to image_tag(resource.image, width: 300), resource.image, target: '_blank'
        else
          status_tag 'None'
        end
      end
      row :title
      row :slug
      row :state
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Image Page Details' do
      f.semantic_errors(*f.object.errors.keys)
      f.inputs do
        image = ['image image size should be x:y for best results.']
        image += if object.image.blank?
                            [br, content_tag(:span, 'No image Image Uploaded', class: 'status_tag no_image')]
                          else
                            [br, link_to(image_tag(object.image, width: 300), object.image, title: 'Click to see original', target: '_blank')]
                          end
        image = safe_join image
  

        f.input :image, as: :file, hint: image

        f.input :title
        f.input :slug

        f.input :location,
                as: :select,
                value: f.object.location,
                collection: ['Little Ducklings', 'Little Ducklings Pond', 'Little Ducklings Lake' ]
        f.input :state,
                as: :select,
                value: f.object.state,
                collection: ['draft', 'published']
        f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."  


        
        
    
        
      end
    end
    f.actions
  end 

end


