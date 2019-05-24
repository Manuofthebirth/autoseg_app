class CreateSubtasks < ActiveRecord::Migration[5.2]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.datetime :completed_at
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
