class AddTitleToForums < ActiveRecord::Migration[7.1]
  def change
    add_column :forums, :title, :string
    add_column :forums, :description, :string
  end
end
