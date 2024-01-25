class AddCreatorToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :creator, :integer
    add_foreign_key :events, :users, column: :creator
  end
end
