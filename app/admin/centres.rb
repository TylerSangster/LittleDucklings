ActiveAdmin.register Centre do
  permit_params :name,  :openning_time,  :payments,  :email,  :phone,  :program_name,  :program_price,  :program_2_name,  :program_2_price,  :program_3_name,  :program_3_price,  :program_4_name,  :program_4_price, 
  programs_attributes: [:id, :title, :ages, :class_size, :cover_photo, :cover_photo2, :_destroy]


  index do
    id_column
    column :name
    column :email
    column :phone




    column :program_name
    column :program_price
    column :program_2_name
    column :program_2_price
    column :program_3_name
    column :program_3_price
    column :program_4_name
    column :program_4_price

    actions
  end

  show do
    attributes_table do

      row :name

      row :openning_time
      row :payments
      row :email
      row :phone
      row :program_name
      row :program_price
      row :program_2_name
      row :program_2_price
      row :program_3_name
      row :program_3_price
      row :program_4_name
      row :program_4_price
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Centre HomePage Details' do
      f.semantic_errors(*f.object.errors.keys)
      f.inputs do

        f.input :name
        f.input :email
        f.input :phone


        f.has_many :programs, allow_destroy: false do |program|
          program.input :title
          program.input :ages
          program.input :class_size
          program.input :cover_photo, as: :file
          program.input :cover_photo2, as: :file

        end

        f.input :program_name
        f.input :program_price
        f.input :program_2_name
        f.input :program_2_price
        f.input :program_3_name
        f.input :program_3_price
        f.input :program_4_name
        f.input :program_4_price
        f.input :openning_time
        f.input :payments
        
        
      end
    end
    f.actions
  end

  
end
