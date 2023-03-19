class CreateAlertTags < ActiveRecord::Migration[7.0]
  def change
    create_table :alert_tags do |t|
      t.references :alert, null: false, index: true, foreign_key: true
      t.references :tag, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
