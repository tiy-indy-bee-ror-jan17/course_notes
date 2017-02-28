class LipsumsController < ApplicationController

  def index
    @lipsums = Lipsum.all
    render json: @lipsums
  end

  def show
    @lipsum = Lipsum.find_by(slug: params[:id])
    render json: @lipsum
  end

  def create
    @lipsum = Lipsum.new(lipsum_params)
    if @lipsum.save
      render json: @lipsum
    else
      render json: @lipsum.errors.full_messages, status: 400
    end
  end

  def update
    @lipsum = Lipsum.find_by(slug: params[:id])

    if @lipsum.update(lipsum_params)
      render json: @lipsum
    else
      render json: @lipsum.errors.full_messages, status: 400
    end
  end

  def destroy
    @lipsum = Lipsum.find_by(slug: params[:id])
    @lipsum.destroy
    render json: {message: "Hasta la vista, baby"}
  end

  private

  def lipsum_params
    # {slug:, body:}
    params.permit(:slug, :body)
  end

end
