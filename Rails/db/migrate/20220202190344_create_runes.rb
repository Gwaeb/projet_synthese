class CreateRunes < ActiveRecord::Migration[7.0]
  def change
    create_table :runes do |t|

      t.string :name,null: false,blank: false
      t.string :description,null: false, blank: false
      t.integer :level, null: false, :unsigned => true
      t.references :category, index: true, foreign_key:{to_table: :categories},null:false

      t.timestamps
    end
  end
end
