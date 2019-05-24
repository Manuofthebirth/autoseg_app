class AddIsprivateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :isprivate, :boolean, default: false, null: false
    remove_column :tasks, :private
  end
end
