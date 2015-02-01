class RemoveCheckedFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :checked, :boolean
  end
end
