class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :alias
      t.string :key
      t.string :status, default: "Open"
      t.integer :user_id

      t.timestamps
    end
  end
end
