class Character < ApplicationRecord
    has_and_belongs_to_many :films
    validates :name, presence: true

    def self.get_all_characters()
        Character.all
    end

    def self.get_character_by_id(id)
        Character.find(id)
    end
end
