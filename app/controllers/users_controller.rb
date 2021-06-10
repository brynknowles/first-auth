class UsersController < ApplicationController

    # get "/profile"
    # def profile 
    #     # byebug

    #     begin
    #         # read the token from the authorization header
    #         auth_headers = request.headers["Authorization"]
    #         token = auth_headers.split.last
    #         # decode the token
    #         payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorthim: 'HS256' })
    #         # get the user id from the payload
    #         user_id = payload[0]["user_id"]
    #         # find the uesr
    #         user = User.find(user_id)
    #         render json: user
    #     rescue
    #         render json: { error: "nice try, pal." }, status: :unauthorized
    #     end
    # end

    def profile
        user = AuthorizeRequest.new(request.headers).user
        if user
            render json: user
        else
            render json: { error: "nice try, pal." }, status: :unauthorized
        end
    end
end