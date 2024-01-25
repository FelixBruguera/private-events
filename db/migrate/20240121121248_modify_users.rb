class ModifyUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :username
    rename_column :users, :email, :username
  end
end
