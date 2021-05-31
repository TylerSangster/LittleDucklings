class AddMealsToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :monday_morning_snack, :string
    add_column :menus, :monday_lunch, :string
    add_column :menus, :monday_afternoon_snank, :string

    add_column :menus, :tuesday_morning_snack, :string
    add_column :menus, :tuesday_lunch, :string
    add_column :menus, :tuesday_afternoon_snank, :string

    add_column :menus, :wednesday_morning_snack, :string
    add_column :menus, :wednesday_lunch, :string
    add_column :menus, :wednesday_afternoon_snank, :string

    add_column :menus, :thursday_morning_snack, :string
    add_column :menus, :thursday_lunch, :string
    add_column :menus, :thursday_afternoon_snank, :string

    add_column :menus, :friday_morning_snack, :string
    add_column :menus, :friday_lunch, :string
    add_column :menus, :friday_afternoon_snank, :string

    add_column :menus, :published_at, :datetime
    add_column :menus, :state, :string, default: "draft"
    remove_column :menus, :date, :string
    remove_column :menus, :description, :string

  end
end
