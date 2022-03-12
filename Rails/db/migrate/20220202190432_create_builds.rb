class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|

      t.references :user, index: true, foreign_key:{to_table: :users},null:false
      t.string :name, null: false, blank: false
      t.integer :category, null: false, :unsigned => true

      t.timestamps
    end
  end
end
