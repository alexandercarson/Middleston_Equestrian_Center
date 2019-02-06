class UsersController < ApplicationController
  #before_action :authorize_user, except: [:show]

  def show
    @user = User.find(params[:id])
    @horse = Horse.all
    @charges = Charge.all
    @events = Event.all
    @problems = Problem.all
    @notes = Note.all
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
      :password,
      :role,
      { roles: [] }
  )
  end
end

