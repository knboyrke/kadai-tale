class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    tale = Tale.find(params[:tale_id])
    current_user.favorite(tale)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    tale = Tale.find(params[:tale_id])
    current_user.unfavorite(tale)
    flash[:success] = 'お気に入りから外しました。'
    redirect_back(fallback_location: root_path)
  end
end
