class CreateInscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :inscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer :progress

      t.timestamps
    end
  end
end
