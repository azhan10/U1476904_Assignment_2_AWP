class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
    	t.string 	:filmtitle
    	t.text 		:filmduration
    	t.text 		:rentalstatus
    	t.integer 		:user_id
    	t.text 		:username
      t.timestamps
    end
  end
end
