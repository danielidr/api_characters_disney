class Character < ApplicationRecord
    has_and_belongs_to_many :films
    validates :name, presence: true, uniqueness: true
    validates :age, :weight, presence: true

    def self.get_all_characters()
        Character.all
    end

    def self.get_character_by_id(id)
        Character.find(id)
    end

    def self.get_character_by_name(name)
        Character.find_by(name: name)
    end

    def self.get_character_by_age(age)
        Character.where(age: age)
    end

    def self.get_character_by_weight(weight)
        Character.where(weight: weight)
    end
end
