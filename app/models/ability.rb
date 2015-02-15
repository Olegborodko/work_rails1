class Ability
  include CanCan::Ability


  def initialize(user)
    
    
    # Define abilities for the passed in user here. For example:

      user ||= Admin.new # guest user (not logged in)

      return if !user.role  

      if user.role.name=="super_admin"


        can :manage, :all

      elsif user.role.name=="admin"

        can :manage, User

      end

  end
end
