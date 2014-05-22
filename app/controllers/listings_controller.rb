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
      @listing = current_user.Listing.create(@listing_params)
      @listing.pictures.create(picture_params)

      respond_with do |format|
        format.js
      format.html { redirect_to listing_path(@listing) }
    end
  end

  def index
    @listings =  Listing.all.where("city like?", "%#{params[:search]}%")
  end

  def show
    @listings =  Listing.all.where(params[:id])
  end

  def update
    authorize(current_user, @listing)

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
      @listing_params = params.require(:listing).permit(:description, :search, :id, :adress, :country, :city, :name, :nb_beds, :nb_bath, :price)
    end

     def set_user
      @user = User.find(params[:id])
    end
end
