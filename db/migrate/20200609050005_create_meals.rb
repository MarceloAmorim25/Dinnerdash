class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :available

      t.timestamps
    end
  end
end
