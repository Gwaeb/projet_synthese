class CreateChampionWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :champion_wishlists do |t|

      t.references :champion, index: true, foreign_key:{to_table: :champions},null:false
      t.references :user, index: true, foreign_key:{to_table: :users},null:false

      t.timestamps
    end
  end
end
