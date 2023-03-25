class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, index: true, foreign_key: true
      t.references :alert, null: true, index: true, foreign_key: true

      t.timestamps
    end
  end
end
