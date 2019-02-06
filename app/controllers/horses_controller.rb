class HorsesController < ApplicationController
  before_action :authorize_user, except: [:show]

  def show
    @horse = Horse.find(params[:id])
    @user = @horse.user
    @veterinarian = @horse.veterinarian
    @farriers = @horse.farrier
    @charges = Charge.all
    @events = Event.all
    @notes = Note.all
    @problems = Problem.all
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      flash[:notice] = "New Horse Added!"
      redirect_to @horse
    else
      flash[:alert] = "New Horse Not Created"
      render :new
    end
  end

  def edit
    @horse = Horse.find(params[:id])
  end

  def update
   @horse = Horse.find(params[:id])
   if @horse.update_attributes(horse_params)
     flash[:notice] = "Horse Updated!"
     redirect_to @horse
   else
     render 'edit'
   end
 end

  def destroy
    @horse = Horse.find(params[:id])

    if @horse.destroy
      flash[:notice] = 'Horse has been deleted.'
      redirect_to new_horse_path
    end
  end

  private

  def horse_params
    params.require(:horse).permit(
      :registered_name,
      :id,
      :barn_name,
      :discipline,
      :breed,
      :picture,
      :user_id,
      :veterinarian_id,
      :farrier_id,
      :problem,
    ).to_h
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
