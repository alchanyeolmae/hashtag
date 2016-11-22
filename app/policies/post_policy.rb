class PostPolicy < ApplicationPolicy
  
  
  def initialize(user, post)
    @user = user
    @post = post
  end
  
  def update?
    user.authority?(post)
  end
end
