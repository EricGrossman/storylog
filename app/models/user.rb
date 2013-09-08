class User < ActiveRecord::Base

attr_accessible :name, :provider, :uid

#Class method callable from Sessions controller (hence the "User.")

def User.create_with_omniauth(auth)
  user = User.new()
  user.provider = auth["provider"]
  user.uid = auth["uid"]
  user.name = auth["info"]["name"]
  user.save
  return user
end

end
