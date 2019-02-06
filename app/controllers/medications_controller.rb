class MedicationsController < ApplicationController
  before_action :authorize_user

  def index
    @medication = Medication.all
  end

  def show
    @medication = Medication.find(params[:id])
    @horse = @medication.horse
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save
      flash[:notice] = "New Medication Added!"
      redirect_to @medication
    else
      flash[:alert] = "New Medication Not Created"
      render :new
    end
  end

  def edit
    @medication = Medication.find(params[:id])

  end

  def destroy
    @medication = Medication.find(params[:id])

    if @medication.destroy
      flash[:notice] = 'Medication has been deleted.'
      redirect_to new_medication_path
    end
  end


  private
  def medication_params
    params.require(:medication).permit(
      :id,
      :horse_id,
      :medication_day,
      :medication_dosage,
      :medication_for,
      :medication_frequency,
      :medication_name,
      :medication_time,
      :medication_notes,
      :medication
      )
    end

    def authorize_user
      if !user_signed_in? || !current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
      end
    end

end
