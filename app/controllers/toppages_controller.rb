class ToppagesController < ApplicationController
  def index
    @pagy, @tales = pagy(Tale.order(id: :desc), items:10)
  end
end
