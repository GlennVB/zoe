class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name, default: ""
      t.text :description
      t.boolean :completed, default: false
      t.integer :user_id
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
