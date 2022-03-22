class Genre < ApplicationRecord
    has_and_belongs_to_many :films

    validates :name, presence: true

    def get_film_by_genre(id)
        Genre.find(id).films
    end
end
