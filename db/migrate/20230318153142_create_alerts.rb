class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.string :type
      t.string :name
      t.string :tag
      t.string :description
      t.string :origin
      t.references :task, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
