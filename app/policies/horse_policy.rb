class HorsePolicy < ApplicationPolicy

  def show?
    return true if user.admin? || user.manager? || user.employee?
    return true if user.id == record.user_id && user.boarder?
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
      scope.all
    end

  end

end
