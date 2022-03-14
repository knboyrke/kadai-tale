class ToppagesController < ApplicationController
  def index
    @pagy, @tales = pagy(Tale.order(id: :desc), items:3)
  end
end
