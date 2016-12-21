class CreateBuyGames < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_games do |t|
    	t.text  	:gametitle
    	t.text 		:gameprice
    	t.text 		:platform
    	t.text 		:paymenttype
    	t.integer 	:user_id
      t.timestamps
    end
  end
end
