class UsersController < ApplicationController
  before_action :require_no_user, except: [:show, :edit, :update]
  before_action :require_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to '/'
    else
      redirect_to '/signup'
    end

  end

  def show
  end
  
  def edit
  end

  def update 
    @user = @current_user

    if @user.update(user_edit_params)
      redirect_to '/user'
    else
      render 'edit'
    end

  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

  private
    def user_edit_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
