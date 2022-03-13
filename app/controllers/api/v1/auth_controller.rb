module Api
    module V1
        class AuthController < V1Controller
            skip_before_action :authenticate!

            def create
                @user = User.find_by(email: login_params[:email])
                if @user&.authenticate(login_params[:password])
                    time = Time.now + 24.hours.to_i
                    token = JsonWebToken.encode({ user_id: @user.id }, time)
                    render json: { token: token, exp: time.strftime('%d-%m-%Y %H:%M'), email: @user.email }
                else
                    render json: { error: 'unauthorized' }, status: :forbidden
                end
            end

            private

            def login_params
                params.require(:user).permit(:email, :password)
            end
        end
    end
end