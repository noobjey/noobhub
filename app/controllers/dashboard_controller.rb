class DashboardController < ApplicationController
  before_action :authorize!

  def show
    user = User.find(params[:id])
    @big_hairy = BigHairy.new(user)
  end
end
