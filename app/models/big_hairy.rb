class BigHairy
  attr_reader :github_service

  def initialize(user)
    @github_service = GithubService.new(user)
  end

  def name
    github_service.user_info['name']
  end

  def profile_pic
    github_service.user_info['avatar_url']
  end

  def starred_repos
    github_service.starred_repository_info.count
  end

  def followers
    github_service.followers.map do |follower|
      follower['login']
    end
  end

  def following
    github_service.following.map do |user|
      user['login']
    end
  end

  def repositories
    github_service.repositories.map do |repo|
      repo['name']
    end
  end
end
