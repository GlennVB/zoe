class CreateSafkes < ActiveRecord::Migration
  def change
    create_table :safkes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
