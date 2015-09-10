class GithubService
  attr_reader :connection,
              :user

  def initialize(user)
    @user = user
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def user_info
    @user_info ||= parse_response(connection.get("users/#{user.username}"))
  end

  def starred_repository_info
    @starred_repository_info ||= parse_response(call_api("starred"))
  end

  def followers
    @followers ||= parse_response(call_api("followers"))
  end

  def following
    @following ||= parse_response(call_api("following"))
  end

  def repositories
    @repositories ||= parse_response(call_api("repos"))
  end

  def organizations
    @organizations ||= parse_response(call_api("orgs"))
  end

  def activities
    @activity ||= parse_response(call_api("events"))
  end

  private

  def call_api(path)
    connection.get("/users/#{user.username}/#{path}")
  end

  def parse_response(response)
    JSON.parse(response.body)
  end

end
