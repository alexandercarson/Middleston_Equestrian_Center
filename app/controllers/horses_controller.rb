class HorsesController < ApplicationController
  before_action :authorize_user
  after_action :verify_authorized


  def show
      @horse = Horse.find(params[:id])
      @veterinarian = @horse.veterinarian
      @farriers = @horse.farrier
      @charges = Charge.all
      @events = Event.all
      @notes = Note.all
      @problems = Problem.all
      @user = User.all
      authorize @horse
  end

  def new
    @horse = Horse.new
    authorize @horse
  end

  def create
    @horse = Horse.new(horse_params)
    authorize @horse
    if @horse.save
      flash[:notice] = "New Horse Added!"
      redirect_to @horse
    else
      flash[:alert] = "Error: Horse Not Created"
      render :new
    end
  end

  def edit
    @horse = Horse.find(params[:id])
    authorize @horse
  end

  def update
   @horse = Horse.find(params[:id])
   authorize @horse
   if @horse.update_attributes(horse_params)
     flash[:notice] = "Horse Updated!"
     redirect_to @horse
   else
      flash[:alert] = "Error: Horse Not Updated!"
     render 'edit'
   end
 end

  def destroy
    @horse = Horse.find(params[:id])
    authorize @horse
    if @horse.destroy
      flash[:notice] = 'Horse has been deleted.'
      redirect_to new_horse_path
    end
  end

  private

  def horse_params
    params.require(:horse).permit(
      :registered_name,
      :user_id,
      :id,
      :barn_name,
      :discipline,
      :breed,
      :picture,
      :veterinarian_id,
      :farrier_id,
      :problem,
      :name
    ).to_h
  end

  def authorize_user
    if !user_signed_in?
      redirect_to root_url
    end
  end
  
end
