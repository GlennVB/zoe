class CreateUserUpdates < ActiveRecord::Migration
  def change
    create_table :user_updates do |t|
      t.integer :user_id
      t.string :description, default: ""
      t.string :icon, default: "fa-bell"
      t.integer :posted_by
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
