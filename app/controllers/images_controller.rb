class ImagesController < ApplicationController
  def new
    @image_upload=Image.new
  end

  def create
    @image_upload=Image.create(uploading_image)
  if  @image_upload.save
    redirect_to '/users'
  end
  end

  def uploading_image
      params.require(:image).permit(:avatar)
  end
end
