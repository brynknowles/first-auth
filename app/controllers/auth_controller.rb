class AuthController < ApplicationController

  # post /register
  def register
    # create a new user
    # byebug
    register_params = params.permit(:username, :password, :bio, :avatar)

    user = User.create(register_params)

    if user.valid?
      render json: user, status: :created
    else
      # render json: { error: "bad job, 0 stars. user already exists!" }, status: :unprocessable_entity
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # post "/login"

  def login
    # find user
    user = User.find_by(username: params[:username])
    # authenticate password
    if user && user.authenticate(params[:password])
      # if the user is authenticated, send back... user object
      render json: user
    else
      # if not, send an error
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end
  
end


