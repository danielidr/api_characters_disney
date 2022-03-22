class Film < ApplicationRecord
    has_and_belongs_to_many :characters
    has_and_belongs_to_many :genres

    validates :title, presence: true, uniqueness: true
    validates :score, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

    def self.get_all_films(order)
        order = order ? order : "DESC"
        Film.all.order(date_created: order)
    end

    def self.get_film_by_title(title)
        Film.find_by(title: title)
    end

    def self.get_film_by_id(id)
        Film.find(id)
    end

    def self.get_character_by_movie(id)
        get_film_by_id(id).characters
    end
end
