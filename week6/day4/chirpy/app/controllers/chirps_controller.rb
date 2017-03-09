class ChirpsController < ApplicationController

  def index
    @chirps = Chirp.order(created_at: :desc).page(params[:page])
  end

  def show
    @chirp = Chirp.find(params[:id])
  end

end
