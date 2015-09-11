class BigHairy
  attr_reader :github_service

  def initialize(user)
    @github_service = GithubService.new(user)
  end

  def name
    github_service.user_info['name']
  end

  def github_username
    github_service.user_info['login']
  end

  def profile_pic
    github_service.user_info['avatar_url']
  end

  def job
    github_service.user_info['company']
  end

  def location
    github_service.user_info['location']
  end



  def contributions
    github_service.contributions
  end

  def longest_streak
    github_service.longest_streak
  end

  def current_streak
    github_service.current_streak
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

  def organizations
    github_service.organizations.map do |org|
      org
    end
  end

  def activities
    github_service.activities.map do |activity|
      activity['type']
    end
  end
end
