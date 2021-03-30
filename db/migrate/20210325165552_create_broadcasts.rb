class CreateBroadcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :broadcasts do |t|
      t.integer :admin_user_id
      t.string :message
      t.timestamps
    end
  end
end
