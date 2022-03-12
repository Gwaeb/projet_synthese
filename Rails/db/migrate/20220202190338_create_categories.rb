class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|

      t.string :name,null: false, blank: false
      t.string :description,null: false, blank: false

      t.timestamps
    end
  end
end
