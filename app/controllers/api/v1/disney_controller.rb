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

            def character_by_query_params
                search = request.query_parameters
                if search['name']
                    render json: Character.get_character_by_name(search['name'])
                elsif search['age']
                    render json: Character.get_character_by_age(search['age'])
                elsif search['weight']
                    render json: Character.get_character_by_weight(search['weight'])
                elsif search['movies']
                    render json: Film.get_character_by_movie(search['movies'])
                else
                    render json: "No value to search"
                end
            end

            def film_detail
                film = Film.get_film_by_title(params[:title])
                render json: films_with_characters(film)
            end

            def film_by_query_params
                search = request.query_parameters
                if search['name']
                    render json: Film.get_film_by_title(search['name'])
                elsif search['genre']
                    render json: Genre.get_film_by_genre(search['genre'])
                else
                    render json: json_structure_film_list(Film.get_all_films(search['order']))
                end
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

            def json_structure_film_list(films)
                array = []
                films.each do |film|
                    f = {}
                    f['image'] = film.image
                    f['title'] = film.title
                    f['date_created'] = film.date_created
                    array.push(f)
                end
                array
            end

            def films_with_characters(film)
                f = {}
                f['film'] = film
                f['characters'] = film.characters
                f
            end

        end
    end
end