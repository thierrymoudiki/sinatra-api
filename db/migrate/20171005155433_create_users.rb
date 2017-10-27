class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password_digest

      t.timestamps(null: false)
    end
  end

  def down
    drop_table :users
  end

end
