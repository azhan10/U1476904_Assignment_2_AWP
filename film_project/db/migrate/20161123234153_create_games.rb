class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
    	t.text 		:gametitle
    	t.text  	:gameDescription
    	t.text 		:gamerating
    	t.text  	:gamegenre
      t.timestamps
    end
  end
end
