class CreateRunePages < ActiveRecord::Migration[7.0]
  def change
    create_table :rune_pages do |t|
      
      t.references :user, index: true, foreign_key:{to_table: :users},null:false
      t.string :name,null: false, blank: false
      t.timestamps
    end
  end
end
