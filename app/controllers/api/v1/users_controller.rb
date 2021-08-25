class Api::V1::UsersController < ApplicationController

  #GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /user/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { message: 'Unable to create user.', error: @user.errors.full_messages }, status: 400
    end
  end

  # PATCH /user/:id

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: { message: 'User successfully updated' }, status: 200
    else
      render json: { message: 'Unable to update User.', error: @user.errors.full_messages }, status: 400
    end
  end

  # DELETE /user/:id

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: { message: 'User successfully deleted' }, status: 200
    else
      render json: { message: 'Unable to delete User.', error: @user.errors.full_messages }, status: 400
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
