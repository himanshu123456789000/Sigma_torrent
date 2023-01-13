class WelcomeController < ApplicationController
  def index
    @browses = Browse.where("browses.name LIKE ?",["%#{params[:query]}%"])
    # @browses = Browse.all
  end
end
