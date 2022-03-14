class AddTitleToTales < ActiveRecord::Migration[6.1]
  def change
    add_column :tales, :title, :string
  end
end
