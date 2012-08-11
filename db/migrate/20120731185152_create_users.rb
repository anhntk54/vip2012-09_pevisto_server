class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user
      t.string :mail
      t.string :addr
      t.string :phone

      t.timestamps
    end
  end
end
