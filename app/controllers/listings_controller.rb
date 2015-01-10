class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :destroy]
  before_action :listing_params, only: [:create, :update]

  respond_to :js, :html

  def welcome
  end

  def new
    @listing = Listing.new
  end

  def create
      @listing = Listing.create(@listing_params)
      @listing.pictures.create(picture_params)

      respond_with do |format|
        format.js
        format.html { redirect_to listing_path(@listing) }
      end
  end

  def index
    @listings =  Listing.all.where("city like?", "%#{params[:search]}%")

    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.json({ title: listing.name })
#      marker.picture({
#             "url" => ,
#             "width" =>  32,
#             "height" => 32})
      marker.infowindow render_to_string(:partial => "/listings/map_box", locals: {listing: listing})
    end
  end

  def show
  end

  def update
    authorize @listing

    @listing.update!(listing_params)
    @listing.pictures.create(picture_params)

    respond_with do |format|
      format.js
      format.html { redirect_to flat_path(flat) }
    end
  end


  def edit
  end

  def destroy
    authorize(current_user, @listing)
    @listing.destroy

    redirect_to root_path
  end

  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def picture_params
      params.require(:listing).permit(:file)
    end

    def listing_params
      @listing_params = params.require(:listing).permit(:user_id, :description, :search, :id, :adress, :country, :city, :name, :nb_beds, :nb_bath, :price)
    end
end
