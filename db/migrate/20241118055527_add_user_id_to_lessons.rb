class AddUserIdToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :user_id, :integer
  end
end
