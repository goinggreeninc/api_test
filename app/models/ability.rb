class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index, :create], Cat
    can [:show, :update, :destroy], Cat do |cat|
      cat.user == user
    end
  end
end