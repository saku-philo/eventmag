class CreateAttends < ActiveRecord::Migration[5.2]
  def change
    create_table :attends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :is_attend
      t.boolean :is_empty, default: true, null: false

      t.timestamps
    end
  end
end
