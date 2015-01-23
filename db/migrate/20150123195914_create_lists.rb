class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
