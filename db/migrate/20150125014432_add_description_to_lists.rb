class AddDescriptionToLists < ActiveRecord::Migration
  def change
    add_column :lists, :Desc, :string
  end
end
