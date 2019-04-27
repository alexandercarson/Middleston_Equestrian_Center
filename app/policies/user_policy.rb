class UserPolicy < ApplicationPolicy


  def show?
    return true if user.admin? || user.manager? || user.employee?
    return true if user.id == @record.id && user.boarder?
    false
  end


    class Scope < Scope
      def resolve
        if user.admin? or user.manager?
          scope.all
        elsif user.boarder?
        end
      end


    def show?
      return true if user.admin? || user.manager? || user.employee?
      return true if user.id == @record.id && user.boarder?
      false
    end


  end

end