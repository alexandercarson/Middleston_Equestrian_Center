class NewProblemCreatedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_problem_created_mailer.new_problem.subject
  #
  def new_problem
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
