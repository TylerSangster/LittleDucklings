ActiveAdmin.register Review do

  permit_params :state, :body, :location, :reviewer, :published_at, :created_at, :updated_at

  index do
    id_column
    column :reviewer
    column :body
    column :state
    column :published_at
    actions
  end

  show do
    attributes_table do
      row :reviewer
      row :body
      row :state
      row :published_at
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'BlogPost Details' do
      f.input :reviewer
      f.input :body
      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published']

      f.input :published_at
      # f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
    end
    f.actions
  end
end