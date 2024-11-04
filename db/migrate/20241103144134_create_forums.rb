class CreateForums < ActiveRecord::Migration[7.1]
  def change
    create_table :forums do |t|
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
