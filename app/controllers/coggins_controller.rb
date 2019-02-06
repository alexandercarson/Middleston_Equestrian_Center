class CogginsController < ApplicationController
  before_action :authorize_user, except: [:show]

  def index
    @coggins = Coggin.all
  end

  def show
    @coggin = Coggin.find(params[:id])
    @horse = @coggin.horse
  end

  def new
    @coggin = Coggin.new
  end

  def create
    @coggin = Coggin.new(coggin_params)
    if @coggin.save
      flash[:notice] = "New Coggin Added!"
      redirect_to @coggin
    else
      flash[:alert] = "New Coggin Not Created"
      render :new
    end
  end

  def edit
    @coggin = Coggin.find(params[:id])
  end

  def update
   @coggin = Coggin.find(params[:id])
   if @coggin.update_attributes(coggin_params)
     flash[:notice] = "Coggin Updated!"
     redirect_to @coggin
   else
     render 'edit'
   end
 end

  def destroy
    @coggin = Coggin.find(params[:id])

    if @coggin.destroy
      flash[:notice] = 'Coggin has been deleted.'
      redirect_to new_coggin_path
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
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
