class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid, provider: data.provider)

    user.token = data.credentials.token
    user.name = data.info.name
    user.username = data.info.nickname
    user.image_url = data.info.image

    user.save
    user
  end
end
