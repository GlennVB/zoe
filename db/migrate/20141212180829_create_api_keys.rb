class CreateApiKeys < ActiveRecord::Migration
  def change
    if api_keys.table_exists?
      drop_table :api_keys
    end
    create_table :api_keys do |t|
      t.string :alias
      t.string :key
      t.string :status, default: "Open"
      t.integer :user_id

      t.timestamps
    end
  end
end
