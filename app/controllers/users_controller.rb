class UsersController < ApplicationController

  def show
  end

  def new
    session[:return_path] = request.referrer
    @user = User.new
    @user.build_picture
  end

  def create
    user = User.new(user_params)

    if user.save
      Picture.create!(pic_params[:image].merge({imageable_id: user.id}))
      session[:user_id] = user.id
      redirect_to session[:return_path]
      session.delete(:return_path)
    else
      flash[:error] = user.errors.full_messages
      redirect_to signup_path
    end
  end

  def edit
  end

  def update
    binding.pry
    if current_user
      current_user.remove_image!
      Picture.create!(pic_params[:image].merge({imageable_id: current_user.id}))
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password )
    end

    def pic_params
      params.require(:user).permit(image: [ :imageable_id, :imageable_type, :image ] )
    end
end
