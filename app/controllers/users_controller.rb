# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize, except: %i[new create]

  def show
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      flash[:notice] = 'Account created successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_back fallback_location: root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
