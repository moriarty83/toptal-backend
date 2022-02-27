class CreateFoodEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :food_entries do |t|
      t.string :food
      t.integer :calories

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
