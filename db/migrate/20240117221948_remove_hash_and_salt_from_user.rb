class RemoveHashAndSaltFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :salt, :string
    remove_column :users, :password_hash, :text
  end
end
