class CreateHorseMailer < ApplicationMailer
    default from: 'maneframeapp@gmail.com'

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.horse_problem_mailer.new_problem.subject
    #  h.user.id === @user.id
  
    def update_user_create(current_user, user, horse, problem)
      @current_user = current_user
      @horse = problem.horse
      @problem = problem
      @user = user
      mail to: 'joec08@gmail.com',
        subject: 'An update was just submitted for your horse!'
    end
  end
