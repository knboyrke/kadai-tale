class TalesController < ApplicationController
  
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @tale = current_user.tales.build(tale_params)
    if @tale.save
      flash[:success] = 'おはなしを投稿しました。'
      redirect_to root_url
    else
      @pagy, @tales = pagy(current_user.tales.order(id: :desc))
      flash.now[:danger] = 'おはなしの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @tale.destroy
    flash[:success] = 'おはなしを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def tale_params
    params.require(:tale).permit(:content)
  end
  
  def correct_user
    @tale = current_user.tales.find_by(id: params[:id])
    unless @tale
      redirect_to root_url
    end
  end
  
end
