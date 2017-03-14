class ChirpsController < ApplicationController

  before_action :require_user, only: [:new, :create, :destroy]
  before_action :is_owner, only: [:destroy]

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
    @chirp = current_user.chirps.new(chirp_params)
    if @chirp.save
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    @chirp.destroy
    redirect_to :root
  end

  private

  def chirp_params
    # {chirp: {user_id: , body:}}
    params.require(:chirp).permit(:body)
  end

  def is_owner
    @chirp = current_user.chirps.find_by(id: params[:id])
    unless @chirp && @chirp.user == current_user
      flash[:danger] = "That's not your chirp, bucky"
      redirect_to :root
    end
  end

end
