Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['github_id'], ENV['github_secret']
  # provider :github, '2a892769e890baa3831f', '8dc3e8f16151cc578dfd3b2bc091e6cc06dcd204'
end
