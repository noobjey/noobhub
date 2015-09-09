class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.create(name: )
  end
end
