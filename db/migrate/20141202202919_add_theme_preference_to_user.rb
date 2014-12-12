class AddThemePreferenceToUser < ActiveRecord::Migration
  def change
    add_column :users, :theme_preference, :string, default: "skin-blur-blue"
  end
end
