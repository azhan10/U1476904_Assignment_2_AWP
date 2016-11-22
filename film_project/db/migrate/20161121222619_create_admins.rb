class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
    	t.text :name
    	t.text :email
    	t.text :password_digest
      t.timestamps
    end
  end
end
