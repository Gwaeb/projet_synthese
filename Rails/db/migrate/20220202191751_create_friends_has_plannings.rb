class CreateFriendsHasPlannings < ActiveRecord::Migration[7.0]
  def change
    create_table :friends_has_plannings do |t|

      t.references :planning, index: true, foreign_key:{to_table: :plannings}, null: false
      t.references :friend, index: true, foreign_key:{to_table: :users}, null: false
      t.datetime :accepted_at, null: true
    
      t.timestamps
    end
  end
end
