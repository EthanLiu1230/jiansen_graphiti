class ImagesController < ApplicationController
  def create
    content = Content.find(params.require(:content_id))
    content.images.attach(params.require(:images))
    render status: :created
  end
end
