class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(
      uid: data.uid,
      provider: data.provider,
      token: data.credentials.token,
      username: data.extra.raw_info.login)

    user.save
    user
  end

end
