class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table "notices", force: :cascade do |t|
      t.string   "title"
      t.text   "body"
      t.string "author"
      t.datetime "puslished_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
