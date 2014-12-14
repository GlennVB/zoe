class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :sizex
      t.integer :sizey
      t.string :status

      t.timestamps
    end
  end
end
