class StorePolicy < ApplicationPolicy
  def index?
    user.has_any_role?(:admin)
  end

  def show?
    user.has_any_role?(:admin)
  end

  def create?
    user.has_any_role?(:admin)
  end

  def new?
    create?
  end

  def new_factory?
    create?
  end

  def update?
    user.has_any_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_any_role?(:admin)
  end

  def delete?
    self.destroy?
  end
end