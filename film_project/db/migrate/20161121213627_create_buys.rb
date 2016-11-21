class CreateBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :buys do |t|
    	t.text  	:filmtitle
    	t.text 		:filmprice
    	t.text 		:paymenttype
    	t.integer 	:user_id
      t.timestamps
    end
  end
end
