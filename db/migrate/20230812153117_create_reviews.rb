class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.references :local, null: false, foreign_key: true

      t.timestamps
    end
  end
end
