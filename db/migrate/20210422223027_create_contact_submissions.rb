class CreateContactSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_submissions do |t|
      t.string "name"
      t.string "email"
      t.string "subject"
      t.string "location"
      t.text "message"
      t.timestamps
    end
  end
end
