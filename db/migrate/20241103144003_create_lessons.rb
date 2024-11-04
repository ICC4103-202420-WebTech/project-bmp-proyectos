class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :content_type
      t.text :content
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
