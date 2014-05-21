class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :destroy]
  before_action :listing_params, only: [:create, :update]

  def welcome
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(@listing_params)
    @listing.pictures.create(picture_params)

    redirect_to listing_path(@listing)
  end

  def index
    @listings =  Listing.all.where("city like?", "%#{params[:search]}%")
  end

  def show
    @listings =  Listing.all.where(params[:id])
  end

  def edit
  end

  def destroy
  end

  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def picture_params
      params.require(:listing).permit(:file)
    end

    def listing_params
      @listing_params = params.require(:listing).permit(:search, :id, :picture, :adress, :country, :city, :name, :nb_beds, :nb_bath, :price)
    end

end
