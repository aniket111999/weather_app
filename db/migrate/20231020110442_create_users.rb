class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, limit: 128, null: false
      t.string :password_confirmation, limit: 128, null:false
      t.timestamps
    end
  end
end
