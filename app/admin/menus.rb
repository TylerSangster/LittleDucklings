ActiveAdmin.register Menu do

  permit_params :title, :monday_morning_snack, :monday_lunch, :monday_afternoon_snank, :tuesday_morning_snack, :tuesday_lunch, :tuesday_afternoon_snank, :wednesday_morning_snack, :wednesday_lunch, :wednesday_afternoon_snank, :thursday_morning_snack, :thursday_lunch, :thursday_afternoon_snank, :friday_morning_snack, :friday_lunch, :friday_afternoon_snank, :published_at, :created_at, :updated_at, :state

  index do
    id_column
    column :title
    column :monday_morning_snack
    column :monday_lunch
    column :monday_afternoon_snank
    column :published_at
    column :state
    actions
  end

  show do
    attributes_table do
      row :title
      row :monday_morning_snack
      row :monday_lunch
      row :monday_afternoon_snank
      row :tuesday_morning_snack
      row :tuesday_lunch
      row :tuesday_afternoon_snank
      row :wednesday_morning_snack
      row :wednesday_lunch
      row :wednesday_afternoon_snank
      row :thursday_morning_snack
      row :thursday_lunch
      row :thursday_afternoon_snank
      row :friday_morning_snack
      row :friday_lunch
      row :friday_afternoon_snank
      row :state
      row :published_at
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Menu Details' do
      f.input :title
      f.input :monday_morning_snack
      f.input :monday_lunch
      f.input :monday_afternoon_snank
      f.input :tuesday_morning_snack
      f.input :tuesday_lunch
      f.input :tuesday_afternoon_snank
      f.input :wednesday_morning_snack
      f.input :wednesday_lunch
      f.input :wednesday_afternoon_snank
      f.input :thursday_morning_snack
      f.input :thursday_lunch
      f.input :thursday_afternoon_snank
      f.input :friday_morning_snack
      f.input :friday_lunch
      f.input :friday_afternoon_snank

      f.input :state,
              as: :select,
              value: f.object.state,
              collection: ['draft', 'published']
      f.input :published_at, as: :date_time_picker, hint: "In #{ Time.current.zone } time zone."
    end
    f.actions
  end
end
