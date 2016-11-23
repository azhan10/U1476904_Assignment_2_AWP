class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :salt
      t.text     :firstname
    t.text     :secondname
    t.text     :address
    t.text     :postcode
      t.timestamps
    end
  end
end
