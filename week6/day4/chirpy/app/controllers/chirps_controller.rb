class ChirpsController < ApplicationController

  def index
    @chirps = Chirp.page(params[:page])
  end

  def show
    @chirp = Chirp.find(params[:id])
  end

  def new
    @chirp = Chirp.new
  end

  def create
    @chirp = Chirp.new(chirp_params)
    if @chirp.save
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    @chirp = Chirp.find(params[:id])
    @chirp.destroy
    redirect_to :root
  end

  private

  def chirp_params
    # {chirp: {user_id: , body:}}
    params.require(:chirp).permit(:user_id, :body)
  end

end
