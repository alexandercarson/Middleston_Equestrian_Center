class ProblemsController < ApplicationController
  before_action :authorize_user, except: [:show]
  
  def show
    @problem = Problem.find(params[:id])
    @horse = @problem.horse
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @user = User.all
    if @problem.save
    CreateHorseMailer.update_user_create(current_user, @user, @horse, @problem).deliver
      flash[:notice] = "New problem Added!"
      redirect_to @problem
    else
      flash[:alert] = "There was an error and the new problem was not Created"
      render :new
    end
  end

  def edit
    @problem = Problem.find(params[:id])
  end


  def update
   @problem = Problem.find(params[:id])
   @horse = @problem.horse
   @user = User.all
   if @problem.update_attributes(problem_params)
    UpdateHorseMailer.update_user(current_user, @user, @horse, @problem).deliver
     flash[:notice] = "Problem Updated!"
     redirect_to @problem
   else
     render 'edit'
   end
 end

  def destroy
    @problem = Problem.find(params[:id])

    if @problem.destroy
      flash[:notice] = 'Problem has been deleted.'
      redirect_to new_problem_path
    end
  end


  private

  def problem_params
    params.require(:problem).permit(
      :date,
      :time,
      :description,
      :notes,
      :user_id,
      :horse_id
      )
  end



  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
