class CreateRunesHasRunesPages < ActiveRecord::Migration[7.0]
  def change
    create_table :runes_has_runes_pages do |t|

      t.references :rune, index: true, foreign_key:{to_table: :runes},null:false
      t.references :rune_page, index: true, foreign_key:{to_table: :rune_pages},null:false


      t.timestamps
    end
  end
end
