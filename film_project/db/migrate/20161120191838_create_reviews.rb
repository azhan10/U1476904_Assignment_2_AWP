class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :commenter
      t.text :body
      t.string :rating
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
