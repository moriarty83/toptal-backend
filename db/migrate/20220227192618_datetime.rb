class Datetime < ActiveRecord::Migration[6.1]
  def change
    add_column :food_entries, :date, :date
    add_column :food_entries, :time, :time
  end
end
