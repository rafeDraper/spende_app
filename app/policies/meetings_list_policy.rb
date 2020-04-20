class MeetingsListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def new?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show?
    user.admin? || user.editor?
  end
end
