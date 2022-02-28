class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :product
      t.integer :calories
      t.date :date
      t.time :time

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
