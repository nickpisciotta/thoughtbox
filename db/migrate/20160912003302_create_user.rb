class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |t|
      t.string :email
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps null:false 
    end
  end
end
