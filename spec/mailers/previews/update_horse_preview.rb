# Preview all emails at http://localhost:3000/rails/mailers/update_horse
class UpdateHorsePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/update_horse/update_user
  def update_user(current_user, horse, problem)
    @current_user = current_user
    @horse = problem.horse
    @problem = problem
    mail to: problem.horse.user.id,
        subject: "Success! You did it."

  end

end
