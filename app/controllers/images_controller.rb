class ImagesController < ApplicationController
  def create
    content = Content.find(params.require(:content_id))
    content.images.attach(params.require(:images))
    render status: :created
  end

  def destroy
    content = Content.find(params.require(:content_id))
    content.images.find(params.require(:id)).purge
    render status: :ok
  end

  def destroy_all
    content = Content.find(params.require(:content_id))
    content.images.purge
    render status: :ok
  end

  def show
    image = ImageResource.find(params)
    respond_with(image)
  end
end
