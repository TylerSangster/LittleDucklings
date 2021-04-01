class CreateParents < ActiveRecord::Migration[6.1]
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_primary
      t.string :phone_secondary
      t.boolean :primary_contract
      t.string :street
      t.string :province
      t.string :postal
      t.text :notes

      t.timestamps
    end
  end
end
