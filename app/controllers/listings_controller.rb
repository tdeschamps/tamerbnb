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
  end

  def show
    @listings =  Listing.all.where(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

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

     def set_user
      @user = User.find(params[:id])
    end

    def set_params
      @user_params = params.require(:user).permit(:first_name, :last_name,
        :password, :user_name, :bio, :birth_date, :profile_picture, :picture, :email)
    end

end
