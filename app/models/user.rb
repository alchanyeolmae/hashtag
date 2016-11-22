class User < ActiveRecord::Base
  has_friendship
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def self.search(search)
    where("nickname LIKE ?", "%#{search}%")
  end
  
  def read_authority?(post)
    if self == post.user
      true
    elsif self.friends_with?(post.user) and not post.secret?
      true
    elsif not self.friends_with?(post.user) and post.all?
      true 
    else
      false
    end
  end
  
  def authority?(post)
    self == post.user
  end
end
