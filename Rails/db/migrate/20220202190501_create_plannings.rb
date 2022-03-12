class CreatePlannings < ActiveRecord::Migration[7.0]
  def change
    create_table :plannings do |t|

      t.references :creator, index: true, foreign_key:{to_table: :users},null:false
      t.datetime :date, null: false
      t.string :title, null: false, blank: false

      t.timestamps
    end
  end
end
