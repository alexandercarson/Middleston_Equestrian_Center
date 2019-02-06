# Preview all emails at http://localhost:3000/rails/mailers/new_problem_created
class NewProblemCreatedPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_problem_created/new_problem
  def new_problem
    NewProblemCreatedMailer.new_problem
  end

end
