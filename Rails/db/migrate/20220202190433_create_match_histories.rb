class CreateMatchHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :match_histories do |t|

      t.integer :position, null: false, :unsigned => true
      t.boolean :victory, null: false
      t.references :champion, index: true, foreign_key:{to_table: :champions},null:false
      t.references :user, index: true, foreign_key:{to_table: :users},null:false
      t.references :build, index: true, foreign_key:{to_table: :builds},null:false
      t.references :rune_page, index: true, foreign_key:{to_table: :rune_pages},null:false
      t.integer :last_item, null: false, :unsigned => true

      t.timestamps
    end
  end
end
