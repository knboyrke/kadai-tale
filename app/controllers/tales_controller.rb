class TalesController < ApplicationController
  
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy, :edit, :update]
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def index
    redirect_to root_url
  end
  
  def show
    @tale = Tale.find(params[:id])
  end
  
  def edit
    @tale = Tale.find(params[:id])
  end
  
  def new
    @tale = Tale.new
  end  
    
  def create
    @tale = current_user.tales.build(tale_params)
    if @tale.save
      flash[:success] = 'おはなしを投稿しました。'
      redirect_to root_url
    else
      @pagy, @tales = pagy(current_user.tales.order(id: :desc))
      flash.now[:danger] = 'おはなしの投稿に失敗しました。'
      render :new 
    end
  end

  def destroy
    @tale.destroy
    flash[:success] = 'おはなしを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def update
    @tale = Tale.find(params[:id])

    if @tale.update(tale_params)
      flash[:success] = 'おはなしは正常に更新されました'
      redirect_to @tale
    else
      flash.now[:danger] = 'おはなしは更新されませんでした'
      render :edit
    end
  end
  
  def rank
    @pagy, @tales = pagy(Tale.order(id: :desc), items:10)
    @tale_like_ranks = Tale.find(Favorite.group(:tale_id).order('count(tale_id) desc').pluck(:tale_id))
  end
  
  def search
    @tales = Tale.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end
  
  private

  def tale_params
    params.require(:tale).permit(:title, :content)
  end
  
  def correct_user
    @tale = current_user.tales.find_by(id: params[:id])
    unless @tale
      redirect_to root_url
    end
  end
  
end
