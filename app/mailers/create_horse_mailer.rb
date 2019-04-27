class CreateHorseMailer < ApplicationMailer
  default from: 'maneframeapp@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.horse_problem_mailer.new_problem.subject
  #  h.user.id === @user.id

  def new_problem_created(current_user, horse, problem)
    @current_user = current_user
    @horse = problem.horse
    @problem = problem
    mail to: @horse.user.email,
      subject: 'An update was just submitted for your horse!'
  end
end
