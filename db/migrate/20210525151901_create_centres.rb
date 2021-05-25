class CreateCentres < ActiveRecord::Migration[6.1]
  def change
    create_table :centres do |t|
      t.string :name
      t.string :welcome_header
      t.text :welcome_body
      t.text :openning_time
      t.text :payments
      t.string :email
      t.string :phone
      t.string :program_name
      t.string :program_price
      t.string :program_2_name
      t.string :program_2_price
      t.string :program_3_name
      t.string :program_3_price
      t.string :program_4_name
      t.string :program_4_price
      

      t.timestamps
    end
  end
end
