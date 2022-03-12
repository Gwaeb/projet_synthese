class CreateSkins < ActiveRecord::Migration[7.0]
  def change
    create_table :skins do |t|

      t.string :name,null: false, blank: false
      t.references :champion, index: true, foreign_key:{to_table: :champions},null:false
      t.integer :price,null: false, :unsigned => true

      t.timestamps
    end
  end
end
