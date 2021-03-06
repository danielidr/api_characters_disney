module Api
    class V1Controller < ActionController::API
        before_action :authenticate!

        private

        def authenticate!
            header = request.headers['Authorization']
            header = header.split(' ').last if header
            begin
                @decoded = JsonWebToken.decode(header)
                @current_user = User.find(@decoded[:user_id])
            rescue ActiveRecord::RecordNotFound => e
                render json: { errors: e.message }, status: :unauthorized
            rescue JWT::DecodeError => e
                render json: { errors: e.message }, status: :unauthorized
            end
        end
    end
end