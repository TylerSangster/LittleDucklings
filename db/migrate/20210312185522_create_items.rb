class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :item_type
      t.string :ingredients
      t.string :description
      t.belongs_to :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
