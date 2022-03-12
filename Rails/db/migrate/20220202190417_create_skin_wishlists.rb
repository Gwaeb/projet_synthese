class CreateSkinWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :skin_wishlists do |t|

      t.references :skin, index: true, foreign_key:{to_table: :skins},null:false
      t.references :user, index: true, foreign_key:{to_table: :users},null:false

      t.timestamps
    end
  end
end
