class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|

      t.references :ask, index: true, foreign_key:{to_table: :users},null:false
      t.references :receive, index: true, foreign_key:{to_table: :users},null:false


      t.timestamps
    end
  end
end
