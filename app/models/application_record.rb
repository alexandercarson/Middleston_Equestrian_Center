class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def admin?
    role == "admin"
  end

  def manager?
    role == "manager"
  end

  def employee?
    role == "employee"
  end

  def boarder?
    role == "boarder"
  end 
  
end
