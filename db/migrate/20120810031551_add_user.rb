class AddUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :birthday, :date
  end
end
