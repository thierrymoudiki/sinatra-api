class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password

      t.timestamps
    end
  end
end
