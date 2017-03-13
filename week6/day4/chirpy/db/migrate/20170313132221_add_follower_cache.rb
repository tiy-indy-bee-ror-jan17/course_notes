class AddFollowerCache < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followers_count, :integer, :default => 0
    add_column :users, :followees_count, :integer, :default => 0
  end
end
