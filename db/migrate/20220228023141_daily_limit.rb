class DailyLimit < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :daily_limit, :integer, :default => 2100

  end
end
