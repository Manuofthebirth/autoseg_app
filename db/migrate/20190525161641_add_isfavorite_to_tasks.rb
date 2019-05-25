class AddIsfavoriteToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :isfavorite, :boolean, default: false, null: false
  end
end