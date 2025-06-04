class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user # Assuming Devise is used
    if @flat.save
      redirect_to flat_path(@flat), notice: "Flat created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :location, :price_per_night, photos: [])
  end
end
