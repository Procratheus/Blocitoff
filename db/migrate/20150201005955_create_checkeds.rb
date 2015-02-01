class CreateCheckeds < ActiveRecord::Migration
  def change
    create_table :checkeds do |t|
      t.references :item, index: true

      t.timestamps
    end
  end
end
