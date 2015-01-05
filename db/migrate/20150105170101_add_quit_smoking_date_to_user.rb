class AddQuitSmokingDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :quit_smoking, :datetime
  end
end
