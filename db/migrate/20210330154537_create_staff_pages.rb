class CreateStaffPages < ActiveRecord::Migration[6.1]
  def change
    create_table "staff_pages", force: :cascade do |t|
      t.string   "name"
      t.text   "body"
      t.string   "location"
      t.string   "state",        default: "draft", null: false
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "staff_pages", ["published_at"], name: "staff_pages_published_at_idx", using: :btree
    add_index "staff_pages", ["state"], name: "staff_pages_state_idx", using: :btree
   
  end
end
