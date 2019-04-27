class ProblemsController < ApplicationController
  before_action :authorize_user



  def index
    @problems = policy_scope(Problem).all
  end

  def show
      @problem = Problem.find(params[:id])
      authorize @problem
      if current_user.id != @problem.user_id
        respond_to do |format|
          format.json { render json: @problems }
          format.html
        end
      end
  end

  def new
    @problem = Problem.new
    authorize @problem
  end

  def create
    @problem = Problem.new(problem_params)
    authorize @problem
    if @problem.save
    NewProblemCreatedMailer.new_problem_created(current_user, @horse, @problem).deliver
      flash[:notice] = "New problem Added!"
      redirect_to @problem
    else
      flash[:alert] = "There was an error and the new problem was not Created"
      render :new
    end
  end

  def edit
    @problem = Problem.find(params[:id])
    authorize @problem
  end


  def update
   @problem = Problem.find(params[:id])
   authorize @problem
   @horse = @problem.horse
   if @problem.update_attributes(problem_params)
    UpdateHorseMailer.update_user(current_user, @horse, @problem).deliver
     flash[:notice] = "Problem Updated!"
     redirect_to @problem
   else
     render 'edit'
   end
 end

  def destroy
    @problem = Problem.find(params[:id])
    authorize @problem
    if @problem.destroy
      flash[:notice] = 'Problem has been deleted.'
      redirect_to new_problem_path
    end
  end

  def problems
    @users = @user.all.collect { |u| [u.name, u.id] }
    respond_to do |format|
      format.json { render json: @users } 
    end
  end 

  private

  def problem_params
    params.require(:problem).permit(
      :date,
      :time,
      :description,
      :notes,
      :horse_id,
      :user_id,
      :id,
      )
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
