class Film < ApplicationRecord
    has_and_belongs_to_many :characters
    has_and_belongs_to_many :genres

    validates :title, presence: true
    validates :score, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
