class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :name,null: false, blank: false
      t.string :description,null: false, blank: false
      t.integer :price, null: false, :unsigned => true
      t.timestamps
    end
  end
end
