class CreateLections < ActiveRecord::Migration[7.1]
  def change
    create_table :lections do |t|
      t.string :title
      t.integer :content_type
      t.text :content
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
