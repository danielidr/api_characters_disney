module Api
    module V1
        class DisneyController < V1Controller

            def character_list
                render json: json_structure_character_list(Character.get_all_characters())
            end

            def character_detail
                character = Character.get_character_by_id(params[:id])
                render json: character_with_films(character)
            end

            private

            def json_structure_character_list(characters)
                array = []
                characters.each do |character|
                    c = {}
                    c['id'] = character.id
                    c['image'] = character.image
                    c['name'] = character.name
                    array.push(c)
                end
                array
            end

            def character_with_films(character)
                c = {}
                c['character'] = character
                c['films'] = character.films
                c
            end

        end
    end
end