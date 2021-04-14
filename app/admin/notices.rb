ActiveAdmin.register Notice do

  permit_params :title, :body, :author, :state, :published_until, :notice_type, :created_at, :updated_at

  index do
    id_column
    column :title
    column :body
    column :author
    column :notice_type
    column :published_until
    column :state

    actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :author
      row :notice_type
      row :state
      row :published_until
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Notice Details' do
      f.input :title
      f.input :body
      f.input :author
      f.input :notice_type,
              as: :select,
              value: f.object.state,
              collection: ['Green', 'Red', 'Yellow']
      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published']
      f.input :published_until, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
    end
    f.actions
  end
end