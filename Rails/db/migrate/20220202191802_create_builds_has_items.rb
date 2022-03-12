class CreateBuildsHasItems < ActiveRecord::Migration[7.0]
  def change
    create_table :builds_has_items do |t|

      t.integer :order, null: false, :unsigned => true
      t.references :build, index: true, foreign_key:{to_table: :builds},null:false
      t.references :item, index: true, foreign_key:{to_table: :items},null:false


      t.timestamps
    end
  end
end
