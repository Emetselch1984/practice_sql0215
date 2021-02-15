class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.integer :gender, null:false
      t.date :birthday


      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, [ :last_name, :first_name ]
  end
end
