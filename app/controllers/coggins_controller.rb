class CogginsController < ApplicationController
  before_action :authorize_user
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  
  def index
    @coggins = policy_scope(Coggin).all
    #@horse  = Horse.find()
    end

  def show
    @coggin = Coggin.find(params[:id])
    @horse = @coggin.horse
    authorize @coggin
  end

  def new
    @coggin = Coggin.new
    authorize @coggin
  end

  def create
    @coggin = Coggin.new(coggin_params)
    authorize @coggin
    if @coggin.save
      flash[:notice] = "New Coggins File Added!"
      redirect_to coggins_path
    else
      flash[:alert] = "New Coggin Not Created"
      render :new
    end
  end

  def edit
    @coggin = Coggin.find(params[:id])
    authorize @coggin
  end

  def update
   @coggin = Coggin.find(params[:id])
   authorize @coggin
   if @coggin.update_attributes(coggin_params)
     flash[:notice] = "Coggin Updated!"
     redirect_to @coggin
   else
     render 'edit'
   end
 end

  def destroy
    @coggin = policy_scope(Coggin).find(params[:id])
    authorize @coggin
    if @coggin.destroy
      flash[:notice] = 'Coggin has been deleted.'
      redirect_to coggins_path
    end
  end

  private

  def coggin_params
    params.require(:coggin).permit(
      :horse_id,
      :coggin
    )
  end

  def authorize_user
    if !user_signed_in?
      redirect_to root_url
      flash[:alert] = "Access Denied: You need to sign in or sign up before continuing!"
    end
  end
  
end
