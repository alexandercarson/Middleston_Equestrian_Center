class ChargesController < ApplicationController
  before_action :authorize_user, except: [:show]
  
  def show
    @charge = Charge.find(params[:id])
    @horse = @charge.horse
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)
    if @charge.save
      flash[:notice] = "New Charge Added!"
      redirect_to @charge
    else
      flash[:alert] = "New Charge Not Created"
      render :new
    end
  end

  def edit
    @charge = Charge.find(params[:id])
  end

  def update
   @charge = Charge.find(params[:id])
   if @charge.update_attributes(charge_params)
     flash[:notice] = "Charge Updated!"
     redirect_to @charge
   else
     render 'edit'
   end
 end

  def destroy
    @charge = Charge.find(params[:id])

    if @charge.destroy
      flash[:notice] = 'Charge has been deleted.'
      redirect_to new_charge_path
    end
  end

  private

  def charge_params
    params.require(:charge).permit(
      :date,
      :description,
      :amount,
      :horse_id
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
