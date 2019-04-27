class ApplicationPolicy
  attr_reader :user, :record, :horse

    def initialize(user, record)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @record = record
    end
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope, :horse

      def initialize(user, scope, horse)
          raise Pundit::NotAuthorizedError, "must be logged in" unless user
          @user = user
          @scope = scope
          @horse = horse
        end
      end
