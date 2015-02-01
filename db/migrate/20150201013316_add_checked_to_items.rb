class AddCheckedToItems < ActiveRecord::Migration
  def change
    add_column :items, :checked, :boolean, default: false
  end
end
