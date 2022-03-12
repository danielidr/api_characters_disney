class CreateJoinTableFilmGenre < ActiveRecord::Migration[5.2]
  def change
    create_join_table :films, :genres do |t|
      t.index [:film_id, :genre_id]
      t.index [:genre_id, :film_id]
    end
  end
end
