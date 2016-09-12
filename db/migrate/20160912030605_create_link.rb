class CreateLink < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.boolean :read, default: false
      t.references :user, index: true, foreign_key: true 
    end
  end
end
