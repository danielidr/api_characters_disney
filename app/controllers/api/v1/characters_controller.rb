module Api
    module V1
        class CharactersController < V1Controller
            before_action :set_character, only: %i[update destroy]

            def create
                @character = Character.new(character_params)
                if @character.save
                    render json: @character
                else
                    render json: @character.errors
                end
            end

            def update
                if @character.update(character_params)
                    render json: @character
                else
                    render json: @character.errors
                end
            end

            def destroy
                @character.destroy
                render json: "Character was successfully destroyed."
            end

            private 

            def set_character
                @character = Character.find(params[:id])
            end
            
            def character_params
                params.require(:character).permit(:name, :age, :weight, :history, :image, {film_ids: []})
            end
        end
    end
end