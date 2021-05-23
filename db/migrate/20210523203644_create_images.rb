class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string   "title"
      t.string   "slug"
      t.string   "location"
      t.string   "state",        default: "draft", null: false
      t.datetime "published_at"

      t.timestamps
    end
    add_index "images", ["published_at"], name: "images_published_at_idx", using: :btree
    add_index "images", ["state"], name: "images_state_idx", using: :btree
  end
end
