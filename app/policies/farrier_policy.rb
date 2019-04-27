class FarrierPolicy < ApplicationPolicy
  
    def index?
      return true if user.admin? || user.manager? || user.employee?
      return true if record.id == user.id && user.boarder?
      false
    end
  
    def show?
      return true if user.admin? || user.manager? || user.employee?
      return true if record.id == user.id && user.boarder?
      false
    end
  
    def new?
      return true if user.admin? || user.manager? || user.employee?
      false
    end
  
    def create?
      return true if user.admin? || user.manager? || user.employee?
      false
    end
  
    def edit?
      return true if user.admin? || user.manager? || user.employee?
      false
    end
  
    def update?
      return true if user.admin? || user.manager? || user.employee?
      false
    end
  
    def destroy?
      return true if user.admin? || user.manager? || user.employee?
      false
    end
  
    class Scope < Scope
      
      def resolve
        if user.admin? || user.manager? || user.employee?
          scope.all
        else
          redirect_to root_path
          flash[:alert] = "Access Denied!"
        end
        end
      end
  
    end
  
  