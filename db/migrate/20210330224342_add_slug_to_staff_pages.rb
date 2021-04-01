class AddSlugToStaffPages < ActiveRecord::Migration[6.1]
  def change
    add_column :staff_pages, :slug, :string
    add_index :staff_pages, :slug, unique: true
  end
end
