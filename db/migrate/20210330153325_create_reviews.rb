class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table "reviews", force: :cascade do |t|
      t.string   "state",        default: "draft", null: false
      t.text   "body"
      t.string   "location"
      t.string   "reviewer"
      t.datetime "published_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "reviews", ["published_at"], name: "reviews_published_at_idx", using: :btree
    add_index "reviews", ["state"], name: "reviews_state_idx", using: :btree
  end
end
