class ApplicationController < ActionController::Base
  
  include SessionsHelper
  include Pagy::Backend

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_tales = user.tales.count
  end
  
  def counts(user)
    @count_tales = user.tales.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likes = user.favorites.count
  end
end
