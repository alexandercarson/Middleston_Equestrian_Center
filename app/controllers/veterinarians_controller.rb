class VeterinariansController < ApplicationController
  def index
    @veterinarians = Veterinarian.all
  end

  def show
    @veterinarian = Veterinarian.find(params[:id])
  end

  def new
    @veterinarian = Veterinarian.new
  end

  def create
    @veterinarian = Veterinarian.new(veterinarian_params)
    if @veterinarian.save
      flash[:notice] = "New Veterinarian Added!"
      redirect_to @veterinarian
    else
      flash[:alert] = "New Veterinarian Not Created"
      render :new
    end
  end

  def edit
    @veterinarian = Veterinarian.find(params[:id])
  end

  def update
   @veterinarian = Veterinarian.find(params[:id])
   if @veterinarian.update_attributes(veterinarian_params)
     flash[:notice] = "Veterinarian Updated!"
     redirect_to @veterinarian
   else
     render 'edit'
   end
 end

  def destroy
    @veterinarian = Veterinarian.find(params[:id])

    if @veterinarian.destroy
      flash[:notice] = 'Veterinarian has been deleted.'
      redirect_to new_veterinarian_path
    end
  end

  private

  def veterinarian_params
    params.require(:veterinarian).permit(
      :name,
      :phone_number,
      :address,
      :city,
      :state,
      :zip_code
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
