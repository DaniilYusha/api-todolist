class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, unique: true, null: false
      t.integer :position, null: false
      t.boolean :is_done, null: false, default: false
      t.references :project, foreign_key: true, index: true

      t.timestamps
    end
  end
end
