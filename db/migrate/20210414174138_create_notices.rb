class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table "notices", force: :cascade do |t|
      t.string "state"
      t.string   "title"
      t.text   "body"
      t.string "author"
      t.string "notice_type"
      t.datetime "published_until"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end