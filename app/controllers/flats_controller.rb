class FlatsController < ApplicationController
  def index
    if params[:query].present?
      begin
        # Primary: geocoder-based nearby search
        @flats = Flat.near(params[:query], 20)
      rescue
        # Fallback if Geocoder can't parse the query
        @flats = Flat.where("location ILIKE ?", "%#{params[:query]}%")
      end
    else
      @flats = Flat.all
    end

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "flats/info_window", locals: { flat: flat }, formats: [:html]),
        marker_html: render_to_string(partial: "flats/marker", locals: { flat: flat }, formats: [:html])
      }
    end
  end

  def properties
    @flats = current_user.flats
    render :index  # this reuses the index view for simplicity
  end


  def show
    @flat = Flat.find(params[:id])
    @markers = [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
  end


  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to properties_path, notice: "Flat created successfully."
    else
      flash.now[:alert] = "Flat creation failed. Please review the form."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :location, :price_per_night, photos: [])
  end
end
