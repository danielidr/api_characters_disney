class Character < ApplicationRecord
    has_and_belongs_to_many :films
    validates :name, presence: true

    def self.get_all_characters()
        Character.all
    end
end
