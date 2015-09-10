class GithubService
  attr_reader :connection,
              :user

  def initialize(user)
    @user = user
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def user_info
    @user_info ||= JSON.parse(connection.get("users/#{user.username}").body)
  end

  def starred_repository_info
    @starred_repository_info ||= JSON.parse(connection.get("/users/#{user.username}/starred").body)
  end

  def followers
    @followers ||= JSON.parse(connection.get("/users/#{user.username}/followers").body)
  end

  def following
    @following ||= JSON.parse(connection.get("/users/#{user.username}/following").body)
  end

end
