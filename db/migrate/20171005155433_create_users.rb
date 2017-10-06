class CreateUsers < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
