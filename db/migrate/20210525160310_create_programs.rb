class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :ages
      t.string :class_size
      t.string :header
      t.text :body
      t.belongs_to :centre
      t.timestamps
    end
  end
end
