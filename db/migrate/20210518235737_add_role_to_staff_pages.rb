class AddRoleToStaffPages < ActiveRecord::Migration[6.1]
  def change
    add_column :staff_pages, :role, :string
  end
end
