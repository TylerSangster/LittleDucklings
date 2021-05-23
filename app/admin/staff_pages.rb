ActiveAdmin.register StaffPage do

  permit_params :name, :cover_photo, :body, :state, :slug, :role, :location, :published_at,  images: []
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
      row :cover_photo do
        if resource.cover_photo.present?
          link_to image_tag(resource.cover_photo, width: 300), resource.cover_photo, target: '_blank'
        else
          status_tag 'None'
        end
      end
      row :name
      row :slug
      row :state
      row :role
      row :body do |page|
        page.body.html_safe
      end 
      row :images do
        div do
          staff_page.images.each do |img|
            div do
              
              
              link_to rails_blob_url(img)
            end
            div do 
              image_tag url_for(img), width: 200
            end
          end
        end
      end
      
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Staff Page Details' do
      f.semantic_errors(*f.object.errors.keys)
      f.inputs do
        cover_photo = ['cover_photo image size should be 250:297 for best results.']
        cover_photo += if object.cover_photo.blank?
                            [br, content_tag(:span, 'No cover_photo Image Uploaded', class: 'status_tag no_image')]
                          else
                            [br, link_to(image_tag(object.cover_photo, width: 300), object.cover_photo, title: 'Click to see original', target: '_blank')]
                          end
        cover_photo = safe_join cover_photo
 

        f.input :cover_photo, as: :file, hint: cover_photo

        f.input :name
        f.input :slug
        f.input :role
        f.input :location,
                as: :select,
                value: f.object.location,
                collection: ['The Little Ducklings', 'The Little Ducklings Pond', 'The Little Ducklings Lake' ]
        f.input :state,
                as: :select,
                value: f.object.state,
                collection: ['draft', 'published']
        f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."  


        
        
        

        f.input :body, as: :froala_editor, input_html: { data: { options: {fontFamily: {
          "'Artifakt Element',Tahoma,Arial,sans-serif": 'Artifakt Element',
          "'Artifakt Legend',Verdana,Helvetica,sans-serif": 'Artifakt Legend',
          "'Amatic SC', 'cursive' ": 'Amatic',
        },
        toolbarButtons: [
          'fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|',
          'color', 'emoticons', 'paragraphStyle', '|',
          'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', 'insertHR', '-',
          'insertLink', 'insertImage', 'insertVideo', 'insertTable', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'
        ],
        key: "<%= ENV['FROALA_EDITOR_ACTIVATION_KEY'] %>",
        heightMin: 300,
        heightMax: 800,
        attribution: false,
        htmlRemoveTags: ['base'],
        htmlAllowedAttrs: ['.*']} } }
        # f.input :body 
        f.input :images, as: :file, input_html: { multiple: true }
        div do
          staff_page.images.each do |img|
            div do
              link_to rails_blob_url(img)
            end
            div do 
              image_tag url_for(img), width: 200
            end
          end
        end
        
      end
    end
    f.actions
  end

  
end
