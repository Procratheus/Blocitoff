class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :lists, :Desc, :description
  end
end
