class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.string :sex
      t.string :location
      t.text :allergies_notes
      t.text :notes
      t.belongs_to :parent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
