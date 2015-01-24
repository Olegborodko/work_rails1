class Ability
  include CanCan::Ability


  def initialize(user)
    #puts '------------------>'+ "#{user}"
    
    # Define abilities for the passed in user here. For example:
   #puts '------------------>'+ "#{user}"

      user ||= Admin.new # guest user (not logged in)

      return if !user.role

      if user.role.name=="super_admin"

        #can :manage, :all
        can :manage, :all
     # end

      #puts '------------------>'+ "#{user}"
      #puts '------------------------->' + "#{admin.admin?}" 
      #if user.role=="admin"

      elsif user.role.name=="admin"

        can :index, Admin

      else

       # can :manage, :all

      end

  end
end
