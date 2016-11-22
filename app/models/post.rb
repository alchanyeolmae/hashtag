class Post < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content
  belongs_to :user
  
  def secret?
    self.scope == 1
  end
  
  def friends?
    self.scope == 2
  end
  
  def all?
    self.scope == 3
  end
  
  #def self.search(search)
   # where("hashtag LIKE ?", "%#{search}%")
  #end
  
end
