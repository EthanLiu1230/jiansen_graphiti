# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  # Configure additional authorization contexts here
  # (`user` is added by default).

  authorize :user, optional: true

  # Read more about authorization context: https://actionpolicy.evilmartians.io/#/authorization_context

  def index?
    true
  end

  def show?
    true
  end

  def create?
    admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  private

  def admin?
    user.admin? or user.super_admin?
  end

  # Define shared methods useful for most policies.
  # For example:
  #
  #  def owner?
  #    record.user_id == user.id
  #  end
end
