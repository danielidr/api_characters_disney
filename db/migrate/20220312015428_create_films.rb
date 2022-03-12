class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.date :date_created
      t.integer :score
      t.string :image

      t.timestamps
    end
  end
end
