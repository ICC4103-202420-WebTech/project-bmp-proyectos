class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.references :forum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
