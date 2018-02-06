class Ability
  include CanCan::Ability

  def initialize(admin)
    return unless admin
    admin.permissions.each do |permission|
      if permission.permission_div == 'default'
        can permission.permission.to_sym, permission.model.constantize
      else
        send("#{permission.model.downcase}_#{permission.permission}")
      end
    end
  end

  def user_read_female
    can :read, User, User.female do |user|
      user.gender == 'female'
    end
  end
end
