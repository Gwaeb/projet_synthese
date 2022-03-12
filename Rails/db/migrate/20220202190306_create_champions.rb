class CreateChampions < ActiveRecord::Migration[7.0]
  def change
    create_table :champions do |t|
      
      t.integer :price, null: false, :unsigned => true
      t.string :name, null: false, blank: false
      t.integer :position,null: false, :unsigned => true
      t.string :description,null: false, blank: false
      t.timestamps
    end
  end
end
