class NotePolicy < ApplicationPolicy
  
  def index?
    return true if user.admin? || user.manager? || user.employee?
    return true if user.id == record.user_id && user.boarder?
    false
  end

  def show?
    return true if user.admin? || user.manager? || user.employee?
    return true if record.horse.user_id == user.id && user.boarder?
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
      elsif 
        user.boarder?
        scope.where(:horse_id => user.id)
      else
        redirect_to root_path
        flash[:alert] = "Access Denied!"
      end
      end
    end

  end

