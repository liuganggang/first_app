class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :emall, unique: true
  end
end
