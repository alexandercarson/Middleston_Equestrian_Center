class FarriersController < ApplicationController

  def index
    @farriers = Farrier.all
  end

  def show
    @farrier = Farrier.find(params[:id])
  end

  def new
    @farrier = Farrier.new
  end

  def create
    @farrier = Farrier.new(farrier_params)
    if @farrier.save
      flash[:notice] = "New Farrier Added!"
      redirect_to @farrier
    else
      flash[:alert] = "New Farrier Not Created"
      render :new
    end
  end

  def edit
    @farrier = Farrier.find(params[:id])
  end

  def update
   @farrier = Farrier.find(params[:id])
   if @farrier.update_attributes(farrier_params)
     flash[:notice] = "Farrier Updated!"
     redirect_to @farrier
   else
     render 'edit'
   end
 end

  def destroy
    @farrier = Farrier.find(params[:id])

    if @farrier.destroy
      flash[:alert] = 'Farrier has been deleted.'
      redirect_to new_farrier_path
    end
  end

  private

  def farrier_params
    params.require(:farrier).permit(
      :name,
      :phone_number,
      :address,
      :city,
      :state,
      :zip_code
    )
  end


end
