class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:error] = t "can_not_find_user"
      redirect_to users_url
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "static_pages.home.welcome"
      redirect_to @user
    else
      flash[:error] = t "create_user"
      render :new
    end
  end

  private

  def user_params
    params.require :user .permit :name, :email, :password, :password_confirmation
  end
end
