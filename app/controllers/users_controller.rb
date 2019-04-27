class UsersController < ApplicationController
 before_action :authorize_user, except: [:new]

  def show
    @user = User.find(params[:id])
    authorize @user
    @horse = Horse.all
    @chafges = Charge.all
    @events = Event.all
    @problems = Problem.all
    @notes = Note.all
    @problem = Problem.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Account was successfully created'
      redirect_to current_user_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'User has been deleted.'
      redirect_to new_user_path
    end
  end

def user_params
  params.require(:user).permit(
      :name,
      :phone_number,
      :address,
      :city,
      :state,
      :zip_code,
      :email,
      :password
  )
  end

  def authorize_user
    if !user_signed_in?
      redirect_to root_url
      flash[:alert] = "ERROR: You need to sign in or sign up before continuing!"
    end
  end
  
end

