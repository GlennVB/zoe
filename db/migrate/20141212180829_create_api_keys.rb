class CreateApiKeys < ActiveRecord::Migration
  def change
    table_name = "api_keys"
    if ActiveRecord::Base.connection.table_exists? table_name
      puts "\n== " + table_name.upcase + " ! " << Time.now.strftime("%H:%M:%S").yellow
      drop_table table_name 
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
