class PicturesController < ApplicationController
  def destroy
    Picture.find(params[:id]).destroy!

    render json: { status: 'OK' }
  end
end