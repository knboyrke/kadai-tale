class ToppagesController < ApplicationController
  def index
    if logged_in?
      @tale = current_user.tales.build  # form_with 用
      @pagy, @tales = pagy(current_user.tales.order(id: :desc))
    end
  end
end
