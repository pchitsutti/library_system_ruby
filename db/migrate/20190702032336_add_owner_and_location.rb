class AddOwnerAndLocation < ActiveRecord::Migration
  def change
    add_column :books, :owner, :int
    add_foreign_key :books, :users, column: :owner
    add_column :books, :location, :string
  end
end
