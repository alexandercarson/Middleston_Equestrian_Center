class NotesController < ApplicationController
  before_action :authorize_user, except: [:show]

  def show
    @note = Note.find(params[:id])
    @horse = @note.horse
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = "New Note Added!"
      redirect_to @note
    else
      flash[:alert] = "New Note Not Created"
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
   @note = Note.find(params[:id])
   if @note.update_attributes(note_params)
     flash[:notice] = "Note Updated!"
     redirect_to @note
   else
     render :edit
   end
 end

  def destroy
    @note = Note.find(params[:id])

    if @note.destroy
      flash[:notice] = 'Note has been deleted.'
      redirect_to new_note_path
    end
  end

  private

  def note_params
    params.require(:note).permit(
      :text,
      :horse_id
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
