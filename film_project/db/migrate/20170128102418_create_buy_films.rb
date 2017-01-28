class CreateBuyFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_films do |t|
    	t.text  	:filmtitle
    	t.text 		:filmprice
    	t.text 		:paymenttype
    	t.integer 	:user_id
      t.timestamps
    end
  end
end
