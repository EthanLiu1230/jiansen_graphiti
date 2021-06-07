class ImagesController < ApplicationController
  def create
    record.images.attach(params.require(:images))
    render status: :created
  end

  def destroy
    record.images.find(params.require(:id)).purge
    render status: :ok
  end

  def destroy_all
    record.images.purge
    render status: :ok
  end

  def show
    image = ImageResource.find(params)
    respond_with(image)
  end

  def index
    images = ImageResource.all(params)
    respond_with(images)
  end

  def record
    record_type = params.keys.find { |key| key[/_id$/] }.split('_')[0]
    model = record_type.camelize.constantize
    model.find(params.require(:"#{record_type}_id"))
  end
end
