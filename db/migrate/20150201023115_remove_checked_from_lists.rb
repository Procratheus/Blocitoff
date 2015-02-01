class RemoveCheckedFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :checked, :boolean
  end
end
